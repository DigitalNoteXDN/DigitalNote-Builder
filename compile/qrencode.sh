#! /usr/bin/bash

cd libs

tar xvfz ../../download/qrencode-4.1.1.tar.gz

cd qrencode-4.1.1

./configure --enable-static --disable-shared --without-tools

make -j 4