#! /usr/bin/env bash

# Compile Boost 1.80.0 (released 2022) with modern compilers.
#
# Boost 1.80's MPL headers (boost/mpl/aux_/integral_wrapper.hpp) deliberately
# underflow enum values via static_cast<T>(value - 1) for prior<>/next<>.
# Clang 16+ promoted -Wenum-constexpr-conversion from a warning to a hard
# error as part of C++20 conformance. This breaks Boost's own b2 self-build
# on macos-15-intel runners (Xcode 16.4 / Clang 17) and any other platform
# bumped to that toolchain.
#
# Boost 1.80's container_hash also references std::unary_function which
# Apple's libc++ removed in SDK 14+; we re-enable via a feature-test macro.
#
# We pass these as cxxflags= properties to b2 directly. GCC silently accepts
# unknown -Wno-* flags so applying these universally is safe across Windows
# MinGW, Linux GCC, and macOS Clang. The libc++ defines are macOS-specific
# but harmless on other platforms (libstdc++ ignores them). Drop these once
# Boost upgrades to >= 1.83.
#
# Args:
#   $1 = extra b2 args (e.g. "address-model=64 toolset=clang -j 4")

cd temp

tar xfz ../../../download/boost_1_80_0.tar.gz

cd boost_1_80_0

./bootstrap.sh mingw

# Compiler flags to suppress Boost-1.80-vs-modern-Clang diagnostics.
# Each must be its own argument when passed to b2 (b2 parses cxxflags=
# tokens individually, no quoting/joining).
BOOST_CXXFLAGS="cxxflags=-Wno-enum-constexpr-conversion \
cxxflags=-Wno-deprecated-builtins \
cxxflags=-Wno-deprecated-declarations \
cxxflags=-Wno-unused-but-set-variable \
cxxflags=-D_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION \
cxxflags=-D_LIBCPP_ENABLE_CXX17_REMOVED_FEATURES"

./b2 install --prefix=$PWD/../../libs/boost_1_80_0 --with-chrono --with-filesystem --with-program_options --with-system --with-thread variant=release link=static threading=multi runtime-link=static stage $BOOST_CXXFLAGS $1
