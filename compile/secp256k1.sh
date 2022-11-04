#! /usr/bin/bash

cd DigitalNote-2/src/secp256k1/

./autogen.sh
./configure --enable-module-recovery --prefix $PWD
make -j 4
