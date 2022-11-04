#! /usr/bin/bash

cd libs

tar xvfz ../../download/db-6.2.32.NC.tar.gz

cd db-6.2.32.NC/build_unix

../dist/configure --enable-mingw --enable-cxx --disable-shared --disable-replication
make -j 4