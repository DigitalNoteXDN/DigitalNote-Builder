#! /usr/bin/bash

mkdir temp
mkdir libs

../compile/berkeleydb.sh
../compile/boost.sh 32
../compile/gmp.sh
../compile/leveldb.sh
../compile/libevent.sh
../compile/miniupnpc.sh
../compile/openssl.sh
../compile/qrencode.sh
../compile/secp256k1.sh
../compile/qt.sh