#!/bin/bash

# The script makes a HTTP GET to the URL passed in the argument.
# For successful queries it prints the result code (e.g. 200).
# For failures the script prints nothing and exits with a non-zero code.
#
# This achieved by setting bash opt errexit to make the script fail early
# and passig the --fail parameter to curl to fail on errors.

set -e

function getResponseCode() {
  local url=$1
  local result
  result=$(curl --fail -o /dev/null -s -w "%{http_code}\n" "${url}")
  echo $result
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  getResponseCode "$1"
fi

