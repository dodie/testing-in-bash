#!/bin/bash

cd "$(dirname "$0")"
rm -rf lib
mkdir lib
cd lib

curl -L -O -J https://github.com/bats-core/bats-core/archive/v1.1.0.tar.gz
tar -zxvf bats-core-1.1.0.tar.gz
mv bats-core-1.1.0 bats-core

curl -L -O -J https://github.com/bats-core/bats-support/archive/v0.3.0.tar.gz
tar -zxvf bats-support-0.3.0.tar.gz
mv bats-support-0.3.0 bats-support

curl -L -O -J https://github.com/bats-core/bats-assert/archive/v2.0.0.tar.gz
tar -zxvf bats-assert-2.0.0.tar.gz
mv bats-assert-2.0.0 bats-assert

