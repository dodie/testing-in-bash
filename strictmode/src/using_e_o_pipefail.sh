#!/bin/bash

# When called with one parameter like "something", it will fail due
# to a non-zero exit code in the 'main' function
# | » ./using_e_o_pipefail.sh something
# | Start
# | » echo $?
# | 1
#
# When called with "special" as a parameter, it will succeed.
# | » ./using_e_o_pipefail.sh special
# | Start
# | special
# | End
# | » echo $?
# | 0

# The next line enables the 'errexit' and 'pipefail' Bash options.
# Excerpt from the man page:
# -e        Exit immediately if a pipeline, a subshell command enclosed in parentheses, or one
#           of the commands executed as part of a command list enclosed by braces
#           exits with a non-zero status.
#
# pipefail  If set, the return value of a pipeline is the value of the last (rightmost) command
#           to exit with a non-zero status, or zero if all commands in the pipeline exit successfully.

set -eo pipefail

function main() {
  echo "Start"

  # When called with an argument that does not contain the string "special" it cause the program to terminate due to -e
  echo "${1}" | grep "special"

  echo "End"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main $@
fi

