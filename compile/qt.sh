#! /usr/bin/bash

cd libs

tar -xf ../../download/qt-everywhere-opensource-src-5.15.7.tar.xz

cd qt-everywhere-src-5.15.7

cp ../../../patch/qfreetypefontdatabase_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private
cp ../../../patch/qwindowsfontdatabase_ft_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private
cp ../../../patch/qwindowsfontdatabase_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private

cp ../../../patch/qwindowsguieventdispatcher_p.h qtbase/include/QtEventDispatcherSupport/5.15.7/QtEventDispatcherSupport/private

cp ../../../patch/qwindowsuiawrapper_p.h qtbase/include/QtWindowsUIAutomationSupport/5.15.7/QtWindowsUIAutomationSupport/private


./configure -static -release -platform win32-g++ -opensource -confirm-license -prefix "$PWD/../qt_static" -qt-zlib -qt-libpng -qt-webp -qt-libjpeg -qt-freetype  -no-opengl -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcharts -skip qtconnectivity -skip qtdatavis3d -skip qtdeclarative -skip qtdoc -skip qtgamepad -skip qtlocation -skip qtlottie -skip qtmacextras -skip qtmultimedia -skip qtnetworkauth -skip qtpurchasing -skip qtquick3d -skip qtquickcontrols -skip qtquickcontrols2 -skip qtquicktimeline -skip qtremoteobjects -skip qtscript -skip qtsensors -skip qtspeech -skip qtsvg -skip qtwayland -skip qtwebglplugin -skip qtwebview -skip webengine -make libs -nomake tools -nomake examples -nomake tests
make -j 8
make install