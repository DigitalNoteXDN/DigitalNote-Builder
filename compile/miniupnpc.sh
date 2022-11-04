#! /usr/bin/bash

cd libs

tar xvfz ../../download/miniupnpc-2.2.4.tar.gz

cd miniupnpc-2.2.4

make -f Makefile.mingw
