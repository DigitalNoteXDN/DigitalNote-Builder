#! /usr/bin/env bash

cd DigitalNote-2/src/secp256k1/

./autogen.sh

./configure --enable-module-recovery $1

make clean

make $2
