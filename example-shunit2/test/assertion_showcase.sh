#!/bin/bash

# This test has a nice assertion...
test_equality1() {
  assertEquals "not equal" 2 2
}

# ... but only this one reports line numbers
test_equality_2() {
  ${_ASSERT_EQUALS_} '"not equal"' 2 2
}

function test_skipped() {
  startSkipping
  # This is broken
  #...
}

function test_partially_skipped() {
  # this is okay
  assertEquals "not equal" 2 2
  startSkipping
  # But this is broken
  assertEquals "not equal" 1 2
}

assertCustomEquals() {
  msg=''
  if [ $# -eq 3 ]; then
    msg="$1 "
    shift
  fi
  expected=$1
  actual=$2

  if [[ "${expected}" != "${actual}" ]]; then
    fail "${msg}expected '${expected}' but got '${actual}'"
  fi
}

testWithCustomAssert() {
  expected='shell'
  actual='shell'
  msg="This should be equal"
  assertCustomEquals "${msg}" "${expected}" "${actual}"
}

# Load shUnit2.
. lib/shunit2/shunit2
