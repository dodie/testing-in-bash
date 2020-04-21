#!/bin/bash

source greeting.sh

function date() {
  echo "Friday"
}
export -f day_of_week

hello "John"
