#! /usr/bin/bash

cd libs

tar -I bzip2 -xvf ../../download/gmp-6.2.1.tar.bz2

cd gmp-6.2.1

./configure
make -j 4