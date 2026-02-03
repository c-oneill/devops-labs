#!/bin/bash

die() {
    echo "$*" >&2
    exit 1
}

[[ $# -eq 1 ]] || die "1 argument required, $# provided"

mkdir -p archives

log_directory=$1

tar --create --gzip --file="archives/logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz" $log_directory

echo "archiving $log_directory"
