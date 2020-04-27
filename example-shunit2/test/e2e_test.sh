#!/bin/bash
 

function test_ice_cream_price_should_be_100_per_portion_for_low_quantities() {
  result=$(src/ice_cream_price.sh 1)
  assertEquals $? 0 # assert success
  assertEquals "${result}" "Total 100"
}

function test_there_should_be_20_percent_discount_for_large_quantities_on_odd_days() {
  # Mocking date by adding a custom executable to the PATH
  export DATE_MOCK_REPLY="1"
  export PATH=test/mocks:$PATH

  result=$(src/ice_cream_price.sh 4)
  assertEquals $? 0 # assert success
  assertEquals "${result}" "Total 320"
}

function test_there_should_be_no_discount_even_for_large_quantities_on_even_days() {
  # Mocking date by adding a custom executable to the PATH
  export DATE_MOCK_REPLY="2"
  export PATH=test/mocks:$PATH

  result=$(src/ice_cream_price.sh 4)
  assertEquals $? 0 # assert success
  assertEquals "${result}" "Total 400"
}

. lib/shunit2/shunit2
