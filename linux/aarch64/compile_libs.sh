#! /usr/bin/bash

mkdir -p temp
mkdir -p libs
mkdir -p config

export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++

echo 'using gcc : aarch64 : aarch64-linux-gnu-g++ ;' > config/user-config.jam

../../compile/berkeleydb.sh "--host aarch64-linux-gnu"
../../compile/boost.sh "--user-config=../../config/user-config.jam toolset=gcc-aarch64 architecture=arm address-model=64 target-os=linux"
../../compile/gmp.sh "--host aarch64-linux-gnu"
../../compile/libevent.sh "--host aarch64-linux-gnu"
../../compile/miniupnpc.sh "build/libminiupnpc.a"
../../compile/openssl.sh "linux-aarch64"
../../compile/qrencode.sh  "--host aarch64-linux-gnu"
../../compile/qt.sh "-platform linux-g++ -xplatform linux-aarch64-gnu-g++"
../../compile/secp256k1.sh "--host=i686-linux-gnu"
../../compile/leveldb.sh