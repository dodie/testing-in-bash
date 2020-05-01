#!/bin/bash

# Set project root as the working directory
cd "$(dirname "$0")"

export PROJECT_DIR="$(realpath ".")"
export SRC="${PROJECT_DIR}/src"
export TEST="${PROJECT_DIR}/test"
export BUILD="${PROJECT_DIR}/build"

lib/bash_unit/bash_unit test/*.sh

