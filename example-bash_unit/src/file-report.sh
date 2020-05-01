#!/bin/bash

mode=$1
path=$2

if [ -z $path  ]; then
    echo "Usage: ./file-report.sh [size|number-of-files] [path]"; >&2
    exit 1
fi

cd "${path}"

case "${mode}" in
    number-of-files)
        ls -1 | wc -l ;;
    size)
        du -h | cut -f1 ;;
    *)
        >&2 echo "Usage: ./file-report.sh [size|number-of-files] [path]"; exit 1 ;;
esac

