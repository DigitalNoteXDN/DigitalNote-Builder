#! /usr/bin/bash

mkdir -p temp
mkdir -p libs

../../compile/berkeleydb.sh "build_unix"
../../compile/boost.sh "address-model=64 toolset=gcc"
../../compile/gmp.sh
../../compile/libevent.sh
../../compile/miniupnpc.sh "libminiupnpc.a"
../../compile/openssl.sh "linux-x86_64"
../../compile/qrencode.sh
../../compile/qt.sh
