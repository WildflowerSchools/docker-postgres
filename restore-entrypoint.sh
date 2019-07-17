#!/bin/bash

if [[ ! -z "${RESTORE_FROM_BACKUP}" ]]; then
  echo "restoring from a backup"
  wal-g backup-fetch $PGDATA $RESTORE_FROM_BACKUP
fi

/docker-entrypoint.sh
