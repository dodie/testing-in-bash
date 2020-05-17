#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRC="${script_dir}/../src"


echo "E2E Test case: early failure due to a non-zero exit status"
echo "=========================================================="
echo "Executing src/using_u.sh without an argument does the following:"
echo " - output 'Start' only"
echo " - terminate with a non-zero exit code"

result=$("${SRC}/using_u.sh")
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
source "${SRC}/using_u.sh"

echo ""
echo ""
echo "Unit Test case: -u applies to functions invoked in a subshell"
echo "============================================================="
echo "After the case of -e I expected that -u is also ignored in subshells,"
echo "but it seems that after all, they are considered. The following unit test"
echo "works similarly to the end-to-end test."


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
echo ""
echo "Unit Test case: the leaked -u modifies the behavior of the test"
echo "==============================================================="
echo "Lets' conclude this demonstration with an unit test should work normally,"
echo "but fails because the -u mode leaks from the sourced file"

# The next test tries to check that a hello variable is not created during the execution of the function. However, it fails, because -u changes how undefined variables can be detected.
main hello


if [ -n $HELLO ]; then
  echo "Test passed!"
else
  echo "Test failed!"
fi

