#! /usr/bin/bash

cd temp

tar xvfz ../../../download/qrencode-4.1.1.tar.gz

cd qrencode-4.1.1

./configure --enable-static --disable-shared --without-tools --prefix=$PWD/../../libs/qrencode-4.1.1 $1
make $2
make install
