#! /usr/bin/bash

cd temp

tar xvfz ../../../download/db-6.2.32.NC.tar.gz

cd db-6.2.32.NC

patch -s -p0 < ../../../../patch/patch-src_dbinc_atomic.h

cd $1

../dist/configure --enable-cxx --disable-shared --disable-replication --prefix=$PWD/../../../libs/db-6.2.32.NC $2
make -j 4
make install
