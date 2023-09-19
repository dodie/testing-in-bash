#!/bin/bash

cd "$(dirname "$0")"
rm -rf lib
mkdir lib
cd lib

curl -L -O -J https://github.com/TypedDevs/bashunit/archive/refs/tags/0.6.0.tar.gz
tar -zxvf bashunit-0.6.0.tar.gz
mv bashunit-0.6.0 bashunit

