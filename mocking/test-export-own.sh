#!/bin/bash

source greeting.sh

function day_of_week() {
  echo "Friday"
}
export -f day_of_week

hello "John"
