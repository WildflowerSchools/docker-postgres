#!/bin/bash
set -Eeo pipefail

if [[ ! -z "${RESTORE_FROM_BACKUP}" ]]; then
    echo "restoring from a backup"
    wal-g backup-fetch $PGDATA $RESTORE_FROM_BACKUP
    echo "restored"
    cat >> ${PGDATA}/recovery.conf <<EOF
restore_command = '/usr/local/sbin/restore_command.sh %f %p'
EOF
    exec "$@"
else
    docker-entrypoint.sh $@
fi
