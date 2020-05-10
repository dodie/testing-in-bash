#!/bin/bash

cd "$(dirname "$0")"
rm -rf lib
mkdir lib
cd lib
VERSION=0.3.1
curl -sL https://github.com/rylnd/shpec/archive/${VERSION}.tar.gz | tar zx --strip-components=1

