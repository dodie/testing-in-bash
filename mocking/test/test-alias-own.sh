#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set up mocks
shopt -s expand_aliases
alias day_of_week="echo 'Friday'"

# Include the function to be tested
SRC="${script_dir}/../src"
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
