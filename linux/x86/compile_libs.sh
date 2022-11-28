#! /usr/bin/env bash

mkdir -p temp
mkdir -p libs

export CFLAGS=-m32
export CXXFLAGS=-m32
export LDFLAGS=-m32

../../compile/berkeleydb.sh "build_unix" "--host=i686-linux-gnu" $1
../../compile/boost.sh "address-model=32 toolset=gcc $1"
../../compile/gmp.sh "--host=i686-linux-gnu" $1
../../compile/leveldb.sh $1
../../compile/libevent.sh "--host=i686-linux-gnu" $1
../../compile/miniupnpc.sh "libminiupnpc.a" $1
../../compile/openssl.sh "linux-x86" $1
../../compile/qrencode.sh "--host=i686-linux-gnu" $1
../../compile/secp256k1.sh "--host=i686-linux-gnu" $1
../../compile/qt.sh "-platform linux-g++ -xplatform linux-g++-32" $1
