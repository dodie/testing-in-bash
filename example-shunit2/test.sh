#!/bin/bash

# Set project root as the working directory
cd "$(dirname "$0")"

for testfile in test/*.sh
do
	echo "Running tests in ${testfile}:"
	$testfile
done


