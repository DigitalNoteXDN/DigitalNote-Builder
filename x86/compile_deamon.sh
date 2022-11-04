#! /usr/bin/bash

export PATH="$PWD/libs/qt-5.15.7/bin:$PATH"

cd DigitalNote-2

qmake DigitalNote.daemon.pro USE_UPNP=1 USE_BUILD_INFO=1

make -j 4
