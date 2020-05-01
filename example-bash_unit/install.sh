#!/bin/bash

cd "$(dirname "$0")"
rm -rf lib
mkdir lib
cd lib

curl -L -O -J https://github.com/pgrange/bash_unit/archive/v1.7.1.tar.gz
tar -zxvf bash_unit-1.7.1.tar.gz
mv bash_unit-1.7.1 bash_unit

