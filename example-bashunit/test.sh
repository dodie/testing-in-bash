#!/bin/bash

# Set project root as the working directory
cd "$(dirname "$0")"

export PROJECT_DIR="$(realpath ".")"
export SRC="${PROJECT_DIR}/src"

lib/bashunit tests/*_test.sh

