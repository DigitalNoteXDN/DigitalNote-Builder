#! /usr/bin/env bash

cd temp

tar -xJf ../../../download/gmp-6.3.0.tar.xz

cd gmp-6.3.0

./configure --prefix=$PWD/../../libs/gmp-6.3.0 $1
make $2
make install
