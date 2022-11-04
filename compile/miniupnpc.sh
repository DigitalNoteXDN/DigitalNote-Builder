#! /usr/bin/bash

cd temp

tar xvfz ../../download/miniupnpc-2.2.4.tar.gz

cd miniupnpc-2.2.4

make -f Makefile.mingw libminiupnpc.a

INSTALLPREFIX=$PWD/../../libs/miniupnpc-2.2.4

mkdir -p $INSTALLPREFIX/include/miniupnpc
mkdir -p $INSTALLPREFIX/lib

cp include/*h $INSTALLPREFIX/include/miniupnpc
cp libminiupnpc.a $INSTALLPREFIX/lib/
