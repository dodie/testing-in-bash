function assert_contains() {
  local expected=$1
  local actual=$2

  if [[ "${actual}" =~ *"${expected}"* ]]; then
    fail "${actual} does not contain ${expected}"
  fi
}
