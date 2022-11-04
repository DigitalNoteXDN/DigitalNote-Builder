#! /usr/bin/bash

cd libs

tar xvfz ../../download/libevent-2.1.12-stable.tar.gz

cd libevent-2.1.12-stable

./autogen.sh
./configure --disable-openssl
make -j 4