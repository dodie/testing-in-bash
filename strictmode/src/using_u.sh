#!/bin/bash

# When called without a parameter, this script will fail due to
# an unbound variable in the 'main' function.
# | » ./using_u.sh
# | ../src/faulty_functions.sh: line 10: 1: unbound variable
# | » echo $?
# | 1
#
# When called with a parameter, it will finish without an error.
# | » ./using_u.sh something
# | The parameter is: something
# | » echo $?
# | 0
#

# This line enables the 'nounset' Bash option.
# From the man page:
# -u   Treat unset variables and parameters other than the special parameters "@" and "*"
#      as an error when performing parameter expansion. If expansion is attempted on an
#      unset variable or parameter, the shell prints an error message, and, if not interactive,
#      exits with a non-zero status.

set -u

function main() {
  # When called without a parameter it should cause the program to terminate due to -u
  echo "The parameter is: ${1}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main $@
fi

