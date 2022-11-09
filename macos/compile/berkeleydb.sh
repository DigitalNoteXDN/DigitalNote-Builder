#! /usr/bin/bash

cd temp

tar xvfz ../../../download/db-6.2.32.NC.tar.gz

cd db-6.2.32.NC

curl -OL https://raw.githubusercontent.com/macports/macports-ports/cb92cb90bdc7fb90212e928db32172546eca0f5b/databases/db60/files/patch-src_dbinc_atomic.h
patch -s -p0 < patch-src_dbinc_atomic.h

cd build_unix

../dist/configure --enable-cxx --disable-shared --disable-replication --prefix=$PWD/../../../libs/db-6.2.32.NC $1
make -j 4
make install
