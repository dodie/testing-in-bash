#!/bin/bash

# Set project root as the working directory
cd "$(dirname "$0")"

# Run tests
lib/bin/shpec

