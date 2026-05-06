#! /usr/bin/env bash

cd temp

tar -xf ../../../download/qt-everywhere-opensource-src-5.15.7.tar.xz -X ../../../patch/exclude_qt.txt

cd qt-everywhere-src-5.15.7

# Qt 5.15.7's bundled libpng (1.6.37) has a stale guard at pngpriv.h:538
# that ends up trying to #include <fp.h> -- Apple's classic-Mac-OS Carbon
# floating-point header -- under newer Clang versions whose predefined
# macros confuse the guard. <fp.h> hasn't existed since Mac OS X 10.7.
# Clang 17 (Xcode 16.4 on macos-15-intel runners) trips this. We comment
# out the stray include so the build falls back to <math.h>. Safe no-op
# on platforms whose Clang/GCC never tripped the guard. Drop this when
# Qt upgrades its bundled libpng to >= 1.6.40.
sed -i.bak 's|^[[:space:]]*#[[:space:]]*include[[:space:]]*<fp\.h>|/* PATCHED OUT: removed stale Apple Carbon fp.h include */|' qtbase/src/3rdparty/libpng/pngpriv.h || true

cp ../../../../patch/qfreetypefontdatabase_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private
cp ../../../../patch/qwindowsfontdatabase_ft_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private
cp ../../../../patch/qwindowsfontdatabase_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private
cp ../../../../patch/qfontengine_ft_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private
cp ../../../../patch/qwindowsnativeimage_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private
cp ../../../../patch/qwindowsfontengine_p.h qtbase/include/QtFontDatabaseSupport/5.15.7/QtFontDatabaseSupport/private

cp ../../../../patch/qwindowsguieventdispatcher_p.h qtbase/include/QtEventDispatcherSupport/5.15.7/QtEventDispatcherSupport/private

cp ../../../../patch/qwindowsuiawrapper_p.h qtbase/include/QtWindowsUIAutomationSupport/5.15.7/QtWindowsUIAutomationSupport/private

cp ../../../../patch/qiosurfacegraphicsbuffer.h qtbase/src/plugins/platforms/cocoa

./configure -static -release -opensource -confirm-license \
    -prefix "$PWD/../../libs/qt-5.15.7" \
    -qt-zlib -qt-libpng -qt-libjpeg -qt-freetype -qt-pcre \
    -no-opengl \
    -skip qtimageformats \
    -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcharts \
    -skip qtconnectivity -skip qtdatavis3d -skip qtdeclarative -skip qtdoc \
    -skip qtgamepad -skip qtlocation -skip qtlottie -skip qtmacextras \
    -skip qtmultimedia -skip qtnetworkauth -skip qtpurchasing \
    -skip qtquick3d -skip qtquickcontrols -skip qtquickcontrols2 \
    -skip qtquicktimeline -skip qtremoteobjects -skip qtscript \
    -skip qtsensors -skip qtspeech -skip qtsvg -skip qtwayland \
    -skip qtwebglplugin -skip qtvirtualkeyboard -skip qtwebchannel \
    -skip qtwebsockets -skip qtwebview -skip webengine \
    -make libs -nomake tools -nomake examples -nomake tests $1
make $2
make install
