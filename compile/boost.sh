#! /usr/bin/bash

cd temp

tar xvfz ../../download/boost_1_80_0.tar.gz

cd boost_1_80_0

./bootstrap.sh mingw

./b2 install --prefix=$PWD/../../libs/boost_1_80_0 --build-type=complete --with-chrono --with-filesystem --with-program_options --with-system --with-thread toolset=gcc variant=release link=static address-model=$1 threading=multi runtime-link=static stage
