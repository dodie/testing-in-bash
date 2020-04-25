load '../lib/bats-support/load'
load '../lib/bats-assert/load'

@test "e2e - ice cream price should be 100 per portion for low quantities" {
  run src/ice_cream_price.sh 1
  assert_success
  assert_output -p "Total 100"
}

@test "e2e - there should be 20% discount for large quantities on odd days" {
  # Mocking date by adding a custom executable to the PATH
  export DATE_MOCK_REPLY="1"
  export PATH=test/mocks:$PATH

  run src/ice_cream_price.sh 4
  assert_success
  assert_output -p "Total 320"
}

@test "e2e - there should be no discount even for large quantities on even days" {
  # Mocking date by adding a custom executable to the PATH
  export DATE_MOCK_REPLY="2"
  export PATH=test/mocks:$PATH

  run src/ice_cream_price.sh 4
  assert_success
  assert_output -p "Total 400"
}

