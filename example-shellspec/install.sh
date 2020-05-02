#!/bin/bash

cd "$(dirname "$0")"
rm -rf lib
mkdir lib
cd lib

curl -L -O -J https://github.com/shellspec/shellspec/archive/0.23.0.tar.gz
tar -zxvf shellspec-0.23.0.tar.gz
mv shellspec-0.23.0 shellspec

