#!/bin/bash

# Set up mocks
shopt -s expand_aliases
alias "date"="echo 'Friday';true"

# Include the function to be tested
SRC="$(dirname .)/../src"
source ${SRC}/greeting.sh

# Execute test case
result=$(hello "John")

# Verify results
expected="What a wonderful day, John!"

if [[ "${result}" == "${expected}" ]]; then
  echo "Test passed!"
else
  echo "Test failed!"
  exit 1
fi
