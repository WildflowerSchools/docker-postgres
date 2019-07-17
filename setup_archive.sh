#!/bin/bash

echo "setting up archiving"
set -e

cat >> ${PGDATA}/postgresql.conf <<EOF
wal_level = replica
archive_mode = on
archive_command = '/usr/local/sbin/archive_command.sh %p'
max_wal_senders = 8
wal_keep_segments = 8
EOF

cat >> ${PGDATA}/recovery.conf <<EOF
restore_command = '/usr/local/sbin/restore_command.sh %f %p'
EOF
