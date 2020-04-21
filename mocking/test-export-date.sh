#!/bin/bash

# Include the function to be tested
source greeting.sh

# Set up mocks
function date() {
  echo "Friday"
}
export -f day_of_week

# Execute test case
result=$(hello "John")

# Verify results
expected="What a wonderful day, John!"

if [[ "${result}" == "${expected}" ]]; then
  echo “Test passed!”
else
  echo “Test failed!”
  exit 1
fi
