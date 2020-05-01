function test_ice_cream_price_should_be_100_per_portion_for_low_quantities() {
  result=$(${SRC}/ice_cream_price.sh 1)
  assert_equals $? 0 # assert success
  assert_equals "${result}" "Total 100"
}

function test_there_should_be_20_percent_discount_for_large_quantities_on_odd_days() {
  # Mocking date by adding a custom executable to the PATH
  export DATE_MOCK_REPLY="1"
  export PATH=${TEST}/mocks:$PATH

  result=$(${SRC}/ice_cream_price.sh 4)
  assert_equals $? 0 # assert success
  assert_equals "${result}" "Total 320"
}

function test_there_should_be_no_discount_even_for_large_quantities_on_even_days() {
  # Mocking date by adding a custom executable to the PATH
  export DATE_MOCK_REPLY="2"
  export PATH=${TEST}/mocks:$PATH

  result=$(${SRC}/ice_cream_price.sh 4)
  assert_equals $? 0 # assert success
  assert_equals "${result}" "Total 400"
}

