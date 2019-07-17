#!/bin/bash

export PGHOST=localhost

wal-g wal-push $1
