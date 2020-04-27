#!/bin/bash

cd "$(dirname "$0")"
rm -rf lib
mkdir lib
cd lib

curl -L -O -J https://github.com/kward/shunit2/archive/v2.1.8.tar.gz
tar -zxvf shunit2-2.1.8.tar.gz
mv shunit2-2.1.8 shunit2

