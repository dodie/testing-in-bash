#!/bin/bash

SRC="$(dirname .)/../src"

# ===========
#  E2E tests
# ===========

echo "E2E - Passing John as a name should set the HELLO_JOHN variable for the defined command"

result=$(${SRC}/custom_env.sh John ${SRC}/simple_greeter.sh)
expected="HELLO_JOHN=1"

if [[ "${result}" == "${expected}" ]]; then
  echo “Test passed!”
else
  echo “Test failed!”
  exit 1
fi


echo "E2E - Passing something else as a name should not set the HELLO_JOHN variable for the defined command"
result=$(${SRC}/custom_env.sh Jane ${SRC}/simple_greeter.sh)
expected="HELLO_JOHN="

if [[ "${result}" == "${expected}" ]]; then
  echo “Test passed!”
else
  echo “Test failed!”
  exit 1
fi


# ============
#  Unit tests
# ============

source ${SRC}/custom_env.sh

echo "set_vars - for Jane HELLO_JOHN should not be set"
set_vars "Jane"

# The evaluation of this condition makes Bash exit with the following error message: "HELLO_JOHN: unbound variable".
# With sourcing the custom_env.sh we want to test we also inherited set -u that makes Bash fail when there's a
# reference to an unbound variable.
#if [ -v $HELLO_JOHN ]; then
  #echo “Test passed!”
#else
  #echo “Test failed!”
  #exit 1
#fi

# This is the adapted version of the check that works with and without -u
if [ -z ${HELLO_JOHN+x} ]; then
  echo “Test passed!”
else
  echo “Test failed!”
  exit 1
fi


echo "set_vars - for Jane HELLO_JOHN should not be set"
set_vars "John"

if [ -n $HELLO_JOHN ]; then
  echo “Test passed!”
else
  echo “Test failed!”
  exit 1
fi

