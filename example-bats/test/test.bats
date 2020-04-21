@test "run script" {
  run src/ice_cream_price.sh 4
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Total 400" ]
}

@test "skip script" {
  skip "This is broken"
  #...
}

@test "using my custom assert" {
  skip "TODO"
  load util/myassert
  run myfun
  [ "$status" -eq 0 ]
  my_assert "${lines[0]}" "Hello"
}

@test "testing a function" {
  source "src/myfun.sh"
  run myfun
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Hello!" ]
}

