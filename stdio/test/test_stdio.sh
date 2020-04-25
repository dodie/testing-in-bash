#!/bin/bash

SRC="$(dirname .)/../src"

echo "Test that the program takes user input and prints the result to the standard output (verifying multiple lines)"

result=$(printf "John\n42\n" | ${SRC}/interactive_greeter.sh)
expected=$(printf "Hello, John!\nYou are 42 years old")

if [[ "${result}" == "${expected}" ]]; then
  echo "Test passed!"
else
  echo "Test failed!"
  exit 1
fi

echo "Test that the program ask questions via standard error"


