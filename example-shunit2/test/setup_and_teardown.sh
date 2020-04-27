#!/bin/bash

# Create test data directories
function oneTimeSetUp() {
  mkdir -p build/testdata
}

# Remove test data directories
function oneTimeTearDown() {
  rm -rf build/testdata
}

# Generate fresh example files for the tests
function setUp() {
  rm -rf build/testdata/*

  for i in {1..3}
  do
    echo "Hello $i" > "build/testdata/${i}.txt"
  done
}

# Assert that the tests did not remove the example files
function tearDown() {
  # Here I've tried to assert on some post conditions for each
  # test, but I've bumped into a bug that prevented it.
  # https://github.com/kward/shunit2/issues/112
  # oneTimeTearDown()/tearDown() is being called an additional time at the end of execution

  startSkipping
  result=$(ls build/testdata -1)
  assertEquals 0 $? # assert success
  assertContains "1.txt" "${result}"
  assertContains "2.txt" "${result}"
  assertContains "3.txt" "${result}"
}

function test_number-of-files_should_return_the_number_of_files_in_the_directory() {
  result=$(src/file-report.sh number-of-files build/testdata)
  assertEquals 0 $?
  assertEquals 3 "${result}"
}

function test_size_should_return_the_total_size_of_the_files_in_the_directory() {
  result=$(src/file-report.sh size build/testdata)
  assertEquals 0 $?
  assertEquals "16K" "${result}"
}

. lib/shunit2/shunit2

