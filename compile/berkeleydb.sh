#! /usr/bin/bash

cd temp

tar xvfz ../../download/db-6.2.32.NC.tar.gz

cd db-6.2.32.NC/build_unix

../dist/configure --enable-mingw --enable-cxx --disable-shared --disable-replication --prefix=$PWD/../../../libs/db-6.2.32.NC
make -j 4
make install
