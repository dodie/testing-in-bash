#!/bin/bash

cd "$(dirname "$0")"
rm -rf lib
mkdir lib
cd lib

TAG=${1-main}

if [[ $TAG != main ]]; then
  echo "> Using a concrete tag '$TAG'"
  curl -L -O -J https://github.com/TypedDevs/bashunit/archive/refs/tags/0.7.0.tar.gz
  tar -zxvf bashunit-0.7.0.tar.gz
  cp bashunit-0.7.0/bin/bashunit temp_bashunit
  rm bashunit-0.7.0.tar.gz
else
  echo "> Using main branch"
  git clone git@github.com:TypedDevs/bashunit.git temp_bashunit
fi

## Common
cd temp_bashunit
./install.sh
cd ..
cp temp_bashunit/bin/bashunit bashunit
rm -rf temp_bashunit
