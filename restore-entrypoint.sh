#!/bin/bash
set -Eeo pipefail

if [[ ! -z "${RESTORE_FROM_BACKUP}" ]]; then
    mkdir -p "$PGDATA"
    if [ -z "$(ls -A $PGDATA)" ]; then
        echo "restoring from a backup"
        wal-g backup-fetch $PGDATA $RESTORE_FROM_BACKUP
        echo "restored"
    else
        echo "$PGDATA not empty, skipping restore"
    fi
    chown -R postgres "$PGDATA"
    chmod 700 "$PGDATA"
    cat >> ${PGDATA}/recovery.conf <<EOF
restore_command = '/usr/local/sbin/restore_command.sh %f %p'
EOF
    chown -R postgres "$PGDATA"
fi

docker-entrypoint.sh $@
