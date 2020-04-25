#!/bin/bash

# Use the "Unofficial Bash Strict Mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

function main() {
  local username=$1
  local fn=$2

  set_vars $username
  $fn
}

function set_vars() {
  local username=$1

  if [[ "${username}" == "John" ]]; then
    export HELLO_JOHN=1
  fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main $@
fi
