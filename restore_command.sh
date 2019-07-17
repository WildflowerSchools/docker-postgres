#!/bin/bash

export PGHOST=localhost

wal-g wal-fetch $1 $2
