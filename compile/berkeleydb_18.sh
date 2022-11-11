##
## Tested to compile newer version of berkeleydb.
## on windows it has missing sys/ioc.h header on compiling. Will be future project.
##
## Reference:
##   https://fossies.org/linux/misc/db-18.1.40.tar.gz
##

#! /usr/bin/bash

cd temp

tar xvfz ../../../download/db-18.1.40.tar.gz

cd db-18.1.40/build_windows

../dist/configure --enable-cxx --disable-shared --disable-replication --prefix=$PWD/../../../libs/db-18.1.40 $1
make -j 4
make install
