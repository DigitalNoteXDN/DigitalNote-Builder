#! /usr/bin/env bash
# DigitalNote v2.0.0.7 — Linux aarch64 cross-compile library build.
#
# Cross-compiles all native libraries (built ON x86_64 host, FOR arm64
# target) into ./libs/. Run from this directory after ./update.sh.
#
# Usage:
#   ./compile_libs.sh                  # serial build
#   ./compile_libs.sh "-j 8"           # parallel with 8 jobs
#
# $1 is forwarded to each compile script as the make-args (-j N).
#
# Toolchain expectations (set up by update.sh):
#   * gcc-aarch64-linux-gnu / g++-aarch64-linux-gnu installed
#   * dpkg --add-architecture arm64; arm64 dev libs (see update.sh)
#   * pkg-config configured for /usr/lib/aarch64-linux-gnu/

mkdir -p temp
mkdir -p libs
mkdir -p config

export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++

echo 'using gcc : aarch64 : aarch64-linux-gnu-g++ ;' > config/user-config.jam

../../compile/berkeleydb.sh "build_unix" "--host aarch64-linux-gnu" $1
../../compile/boost.sh "--user-config=../../config/user-config.jam toolset=gcc-aarch64 architecture=arm address-model=64 target-os=linux $1"
../../compile/leveldb.sh $1
../../compile/libevent.sh "--host aarch64-linux-gnu" $1
../../compile/miniupnpc.sh "libminiupnpc.a" $1
../../compile/openssl.sh "linux-aarch64" $1
../../compile/qrencode.sh "--host aarch64-linux-gnu" $1
../../compile/secp256k1.sh "--host aarch64-linux-gnu" $1
# GMP cross-compiled. --disable-assembly avoids gmp's hand-tuned aarch64
# asm needing a newer host as/ld than ubuntu-22.04 ships. Slight perf
# hit, but produces a clean static .a we can link.
../../compile/gmp.sh "--host=aarch64-linux-gnu --disable-assembly" $1
# Qt: PKG_CONFIG_LIBDIR points at arm64 multiarch paths so configure
# tests succeed against the foreign-arch libs installed via apt :arm64.
PKG_CONFIG_LIBDIR=/usr/lib/aarch64-linux-gnu/pkgconfig:/usr/share/pkgconfig \
PKG_CONFIG_SYSROOT_DIR=/ \
../../compile/qt.sh "-platform linux-g++ -xplatform linux-aarch64-gnu-g++ -bundled-xcb-xinput -fontconfig -system-freetype" ""
