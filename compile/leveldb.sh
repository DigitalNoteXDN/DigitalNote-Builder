#! /usr/bin/env bash

cd DigitalNote-2/src/leveldb/

make clean

make libleveldb.a libmemenv.a $1
