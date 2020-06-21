#!/bin/bash

# When called with a parameter, the script will print YES.
# Otherwise, it will print NO.
# In either case, it will exit with 0.

# | » ./using_no_u.sh
# | NO
# | » echo $?
# | 0
#
# | » ./using_no_u.sh test
# | YES
# | » echo $?
# | 0
#
# If we'd define set -u, it will make the script fail in the NO case.


function main() {
  if [ -n "$1" ]; then
    echo "YES"
  else
    echo "NO"
  fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main $@
fi

