
# required for tests using bats-assert
load '../lib/bats-support/load'
load '../lib/bats-assert/load'

# required for tests using a custom assert
load util/customasserts

@test "skipped test" {
  skip "This is broken"
  #...
}

@test "asserting with conditionals" {
  run src/ice_cream_price.sh 1
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Total 100" ]
}

@test "asserting with bats-assert" {
  run src/ice_cream_price.sh 1
  assert_success
  assert_output -p "Total 100"
}

@test "asserting with custom assertion" {
  run src/ice_cream_price.sh 1
  custom_assert_equal "${lines[0]}" "Total 100"
}

