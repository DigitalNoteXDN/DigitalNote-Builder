#! /usr/bin/bash

export PATH="$PWD/libs/qt_static/bin:$PATH"

cd DigitalNote-2

qmake DigitalNote.app.pro USE_UPNP=1 USE_DBUS=1 USE_QRCODE=1 USE_BUILD_INFO=1

make -j 4
