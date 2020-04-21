#!/bin/bash

# Set project root as the working directory
cd "$(dirname "$0")"

# Run tests
lib/bats-core/bin/bats -r test

