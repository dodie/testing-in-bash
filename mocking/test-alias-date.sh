#!/bin/bash

shopt -s expand_aliases

alias "date"="echo 'Friday';shift;"
alias "+%A"="echo -n ''"

source greeting.sh

hello "John"
