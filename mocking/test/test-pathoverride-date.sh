#!/bin/bash

# Add mocks to the path
export PATH=mocks:$PATH

# Execute test case
SRC="$(dirname .)/../src"
result=$(${SRC}/greeting.sh "John")

# Verify results
expected="What a wonderful day, John!"

if [[ "${result}" == "${expected}" ]]; then
  echo "Test passed!"
else
  echo "Test failed!"
  exit 1
fi
