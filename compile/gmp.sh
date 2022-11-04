#! /usr/bin/bash

cd temp

tar -I bzip2 -xvf ../../download/gmp-6.2.1.tar.bz2

cd gmp-6.2.1

./configure --prefix=$PWD/../../libs/gmp-6.2.1
make -j 4
make install
