#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add mocks to the path
export PATH=mocks:$PATH

# Execute test case
SRC="${script_dir}/../src"
result=$(${SRC}/greeting.sh "John")

# Verify results
expected="What a wonderful day, John!"

if [[ "${result}" == "${expected}" ]]; then
  echo "Test passed!"
else
  echo "Test failed!"
  exit 1
fi
