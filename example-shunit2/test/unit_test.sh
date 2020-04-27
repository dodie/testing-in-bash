#!/bin/bash

function test_ice_cream_price_should_be_100_per_portion_for_low_quantities() {
  source src/ice_cream_price.sh

  result=$(main 1)

  assertEquals 0 $?
  assertContains "${result}" "Total 100"
}

function test_there_should_be_20_percent_discount_for_large_quantities_on_odd_days() {
  # Mocking a function by defining an alias
  shopt -s expand_aliases
  alias "getDay"="echo '1'"

  source src/ice_cream_price.sh

  result=$(main 4)

  assertEquals 0 $?
  assertContains "${result}" "Total 320"
}

function test_there_should_be_no_discount_even_for_large_quantities_on_even_days() {
  # Mocking by exporting functions does not work for shunit2
  startSkipping

  source src/ice_cream_price.sh

  # Mocking a function by exporting a function
  function getDay() { echo "2"; }
  export -f getDay
  result=$(main 4)

  assertEquals 0 $?
  assertContains "${result}" "Total 400"
}

. lib/shunit2/shunit2

