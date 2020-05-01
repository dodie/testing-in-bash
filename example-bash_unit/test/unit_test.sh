function test_ice_cream_price_should_be_100_per_portion_for_low_quantities() {
  source ${SRC}/ice_cream_price.sh

  result=$(main 1)

  assert_equals 0 $?
  assert_equals "${result}" "Total 100"
}

function test_there_should_be_20_percent_discount_for_large_quantities_on_odd_days() {
  # Mocking a function by defining an alias
  shopt -s expand_aliases
  alias "getDay"="echo '1'"

  source ${SRC}/ice_cream_price.sh

  result=$(main 4)

  assert_equals 0 $?
  assert_equals "${result}" "Total 320"
}

function test_there_should_be_no_discount_even_for_large_quantities_on_even_days() {
  source ${SRC}/ice_cream_price.sh

  # Mocking a function by exporting a function
  function getDay() { echo "2"; }
  export -f getDay
  result=$(main 4)

  assert_equals 0 $?
  assert_equals "${result}" "Total 400"
}

function test_mock_alternative_using_fake() {
  source ${SRC}/ice_cream_price.sh

  # Mocking a function by using bash_unit's fake
  fake getDay echo "2"
  result=$(main 4)

  assert_equals 0 $?
  assert_equals "${result}" "Total 400"
}

