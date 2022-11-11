#! /usr/bin/bash

mkdir temp
mkdir libs

export TARGET_OS=NATIVE_WINDOWS

../../compile/berkeleydb.sh "build_windows" "--enable-mingw"
../../compile/boost.sh "toolset=gcc address-model=32"
../../compile/gmp.sh
../../compile/leveldb.sh
../../compile/libevent.sh
../../compile/miniupnpc.sh "libminiupnpc.a"
../../compile/openssl.sh "mingw"
../../compile/qrencode.sh
../../compile/secp256k1.sh
../../compile/qt.sh "-platform win32-g++"