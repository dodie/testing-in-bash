#!/bin/bash

function hello() {
  local username=$1

  if [[ "$(day_of_week)" == "Friday" ]]; then
    echo "What a wonderful day, $username!"
  else
    echo "Hello, $username"
  fi
}

function day_of_week() {
  date +%A
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  hello "John"
fi
