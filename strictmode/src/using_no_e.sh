#!/bin/bash

# The script makes a HTTP GET to the URL passed in the argument.
# It prints the result code for  (e.g. 200).
# For failures the script prints ERROR.
# In both cases the script exists with 0 status code.
#
# This achieved by not setting bash opt errexit, so the script continues even if there's an error.
# However, curl uses --fail which makes it exit with a non-zero code for failures (e.g. HTTP 404).
# This has no effect unless the script is executed in an environment where errexit is set.

function getResponseCode() {
  local url=$1
  local result
  result=$(curl --fail -o /dev/null -s -w "%{http_code}\n" "${url}")
  echo $result
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  getResponseCode "$1"
fi

