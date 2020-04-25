load '../lib/bats-support/load'
load '../lib/bats-assert/load'

@test "ice cream price should be 100 per portion for low quantities" {
  source src/ice_cream_price.sh

  run main 1

  assert_success
  assert_output -p "Total 100"
}

@test "there should be 20% discount for large quantities on odd days" {
  source src/ice_cream_price.sh

  function getDay() { echo "1"; }
  export -f getDay
  run main 4

  assert_success
  assert_output -p "Total 320"
}

@test "there should be no discount even for large quantities on even days" {
  source src/ice_cream_price.sh

  function getDay() { echo "2"; }
  export -f getDay
  run main 4

  assert_success
  assert_output -p "Total 400"
}
