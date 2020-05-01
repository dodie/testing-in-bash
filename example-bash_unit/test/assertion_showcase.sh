# include custom assertions
source "${TEST}/util/customasserts.sh"

test_with_assert_equals() {
  result=$(${SRC}/ice_cream_price.sh 1)
  assert_equals 0 $?
  assert_equals "Total 100" "${result}"
}

pending_test_this_is_broken() {
  #...
  assert_equals "1" "2"
}

test_custom_assertion() {
  assert_contains "Hello" "Hello World"
}
