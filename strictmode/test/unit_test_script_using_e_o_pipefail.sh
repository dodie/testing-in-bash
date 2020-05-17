#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRC="${script_dir}/../src"


echo "E2E Test case: early failure due to a non-zero exit status"
echo "=========================================================="
echo "Executing src/using_e_o_pipefail.sh without an argument does the following:"
echo " - output 'Start', but not 'End'"
echo " - terminate with a non-zero exit code"

result=$("${SRC}/using_e_o_pipefail.sh")
sc=$?

echo ""
echo "Output:"
echo "======="
echo "${result}"
echo ""
echo "Exit code:"
echo "=========="
echo "${sc}"

echo ""
echo ""
echo "It works as expected."
echo "Let's see what happens if we source the script file and to execute it's main"
echo "function directly in the same manner."
echo ""
echo ""
source "${SRC}/using_e_o_pipefail.sh"

echo ""
echo ""
echo "Unit Test case: -e does not apply when the function is executed in a subshell"
echo "============================================================================="
echo "When executing the main function directly, we might expect that the test suite"
echo "terminates early with a non-zero exit code, because we sourced a script with"
echo "a line set -e, and we execute a faulty function in a subshell."
echo "However, the sad reality is the following:"

result=$(main)
sc=$?

echo ""
echo "Output:"
echo "======="
echo "${result}"
echo ""
echo "Exit code:"
echo "=========="
echo "${sc}"

echo ""
echo "The explanation is in the man page:"
echo "> Subshells spawned to execute command substitutions inherit the value of"
echo "> the -e option from the parent shell.  When  not  in  posix  mode,  bash"
echo "> clears the -e option in such subshells."

echo ""
echo "So, although -e is leaked to the test from the sourced file, it has no effect on subshells"
echo "unless posix mode (or inherit_errexit) is enabled."
echo "This can cause problems with unit testing functions where one might"
echo "capture the result of a function with subshells."
echo "Not sure if it's a good idea, but enabling posix mode (or inherit_errexit) would fix this issue."
echo " - set -o posix"
echo " - shopt -s inherit_errexit"


echo ""
echo ""
echo "Unit Test case: the leaked -e modifies the behavior of the test"
echo "==============================================================="
echo "Lets' conclude this demonstration with an unit test should work normally,"
echo "but fails because the -e mode leaks from the sourced file"

# Grep will exit with a 0 exit code when there's a match, and with anon-zero exitcode otherwise
# The next tests try to use this to check whether or not the output contains a certain string
main special | grep special
sc=$?
if [ $? -eq 0 ]; then
	echo "Test passed, output contains 'special'"
fi

main special | grep somethingelse
sc=$?
if [ $? -ne 0 ]; then
	echo "Test passed, output does not contain 'somethingelse'"
fi

