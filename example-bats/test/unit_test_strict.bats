load '../lib/bats-support/load'
load '../lib/bats-assert/load'

@test "e2e testing a script that relies on errexit" {
  # This is how the script behaves when executed directly

  run ../strictmode/src/using_e.sh "https://www.google.com"
  assert_success
  assert_output -p "200"

  run ../strictmode/src/using_e.sh "https://www.google.com/nonexistent"
  assert_failure
  assert_output -p ""
}

@test "unit testing a script that relies on errexit should work the same - fails because -e is not applied" {
  # And this is how the script behaves when it is sourced
  source ../strictmode/src/using_e.sh

  run getResponseCode "https://www.google.com"
  assert_success
  assert_output -p "200"

  run getResponseCode "https://www.google.com/nonexistent"
  assert_failure
  assert_output -p ""
}

@test "e2e testing a script that relies on no errexit" {
  # This is how the script behaves when executed directly

  run ../strictmode/src/using_no_e.sh "https://www.google.com"
  assert_success
  assert_output -p "200"

  run ../strictmode/src/using_no_e.sh "https://www.google.com/nonexistent"
  assert_success
  assert_output -p "404"
}

@test "unit testing a script that relies on no errexit should work the same" {
  # And this is how the script behaves when it is sourced

  source ../strictmode/src/using_no_e.sh

  run getResponseCode "https://www.google.com"
  assert_success
  assert_output -p "200"

  run getResponseCode "https://www.google.com/nonexistent"
  assert_success
  assert_output -p "404"
}

@test "e2e testing a script that relies on nounset" {
  # This is how the script behaves when executed directly

  run ../strictmode/src/using_u.sh Hello
  assert_success
  assert_output -p "The parameter is: Hello"

  run ../strictmode/src/using_u.sh
  assert_failure
  assert_output -p ""
}

@test "unit testing a script that relies on nounset should work the same" {
  # And this is how the script behaves when it is sourced

  source ../strictmode/src/using_u.sh

  run main Hello
  assert_success
  assert_output -p "The parameter is: Hello"

  run main
  assert_failure
  assert_output -p ""
}

@test "e2e testing a script that relies on no nounset" {
  # This is how the script behaves when executed directly

  run ../strictmode/src/using_no_u.sh Hello
  assert_success
  assert_output -p "YES"

  run ../strictmode/src/using_no_u.sh
  assert_success
  assert_output -p "NO"
}

@test "unit testing a script that relies on no nounset should work the same" {
  # And this is how the script behaves when it is sourced

  source ../strictmode/src/using_no_u.sh

  run main Hello
  assert_success
  assert_output -p "YES"

  run main
  assert_success
  assert_output -p "NO"
}

