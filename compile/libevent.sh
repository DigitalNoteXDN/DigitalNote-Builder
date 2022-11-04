#! /usr/bin/bash

cd temp

tar xvfz ../../download/libevent-2.1.12-stable.tar.gz

cd libevent-2.1.12-stable

./autogen.sh
./configure --disable-openssl --prefix=$PWD/../../libs/libevent-2.1.12-stable
make -j 4
make install
