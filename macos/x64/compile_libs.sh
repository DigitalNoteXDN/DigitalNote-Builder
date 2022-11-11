#! /usr/bin/bash

mkdir -p temp
mkdir -p libs

bash ../compile/berkeleydb.sh "build_unix"
bash ../../compile/boost.sh "address-model=64 toolset=clang"
bash ../../compile/gmp.sh
bash ../../compile/libevent.sh
bash ../../compile/miniupnpc.sh "libminiupnpc.a"
bash ../../compile/openssl.sh "darwin64-x86_64-cc"
bash ../../compile/qrencode.sh
bash ../../compile/qt.sh
bash ../../compile/leveldb.sh
bash ../../compile/secp256k1.sh
