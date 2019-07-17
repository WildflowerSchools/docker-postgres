#!/bin/bash

export PGHOST=localhost

wal-g backup-push $1
