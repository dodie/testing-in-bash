#!/bin/bash

# setUp is called before executing each test function
function setUp() {
  source "${SRC}/ice_cream_price.sh"
}

function test_ice_cream_price_should_be_100_per_portion_for_low_quantities() {
  result=$(main 1)

  assertSuccessfulCode
  assertEquals "${result}" "Total 100"
}

function test_there_should_be_20_percent_discount_for_large_quantities_on_odd_days() {
  function getDay() {
    echo "1"
  }

  result=$(main 4)

  assertSuccessfulCode
  assertEquals "${result}" "Total 320"
}

function test_there_should_be_no_discount_even_for_large_quantities_on_even_days() {
  function getDay() {
    echo "2"
  }

  result=$(main 4)

  assertSuccessfulCode
  assertEquals "${result}" "Total 400"
}