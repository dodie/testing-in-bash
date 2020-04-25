# based on https://github.com/bats-core/bats-assert/blob/master/src/assert_equal.bash
function custom_assert_equal() {
  if [[ $1 != "$2" ]]; then
    batslib_print_kv_single_or_multi 8 \
    'expected' "$2" \
    'actual'   "$1" \
    | batslib_decorate 'values are really not the same' \
    | fail
  fi
}
