#! /usr/bin/bash

cd temp

tar xvfz ../../../download/openssl-1.1.1s.tar.gz

cd openssl-1.1.1s

#./Configure LIST

./Configure --prefix=$PWD/../../libs/openssl-1.1.1s no-zlib no-shared no-dso no-camellia no-capieng no-cast no-cms no-dtls1 no-gost no-idea no-md2 no-mdc2 no-rc5 no-rdrand no-rfc3779 no-sctp no-seed no-whirlpool no-rc2 no-rc4 no-ssl3 $1

make depend
make -j 4
make install
