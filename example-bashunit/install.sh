#!/bin/bash

curl -o _install.sh https://raw.githubusercontent.com/TypedDevs/bashunit/main/install.sh

chmod +x _install.sh
./_install.sh
rm _install.sh
