#! /usr/bin/bash

mkdir -p temp
mkdir -p libs

export CFLAGS=-m32
export CXXFLAGS=-m32
export LDFLAGS=-m32

../../compile/berkeleydb.sh "--host=i686-linux-gnu"
../../compile/boost.sh "address-model=32 toolset=gcc"
../../compile/gmp.sh "--host=i686-linux-gnu"
../../compile/libevent.sh "--host=i686-linux-gnu"
../../compile/miniupnpc.sh "build/libminiupnpc.a"
../../compile/openssl.sh "linux-x86"
../../compile/qrencode.sh "--host=i686-linux-gnu"
../../compile/qt.sh "-platform linux-g++ -xplatform linux-g++-32"
../../compile/secp256k1.sh "--host=i686-linux-gnu"
../../compile/leveldb.sh
