#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRC="${script_dir}/../src"

echo "Test that the program takes user input and prints the result to the standard output (verifying multiple lines)"

result=$(printf "John\n42\n" | ${SRC}/interactive_greeter.sh 2>/dev/null)
expected=$(printf "Hello, John!\nYou are 42 years old")

if [[ "${result}" == "${expected}" ]]; then
  echo "Test passed!"
else
  echo "Test failed!"
  exit 1
fi

echo "Test that the program ask questions via standard error"

result=$(printf "Any\n12\n" | ${SRC}/interactive_greeter.sh 2>&1 >/dev/null)
expected=$(printf "Please enter your name:\nPlease enter your age:")

if [[ "${result}" == "${expected}" ]]; then
  echo "Test passed!"
else
  echo "Test failed!"
  exit 1
fi
