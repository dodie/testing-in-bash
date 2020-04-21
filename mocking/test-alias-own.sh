#!/bin/bash

shopt -s expand_aliases
alias day_of_week="echo 'Friday'"

source greeting.sh

hello "John"
