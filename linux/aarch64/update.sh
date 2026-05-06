#! /usr/bin/env bash
# DigitalNote v2.0.0.7 — Linux aarch64 cross-compile dependencies.
#
# Sets up an x86_64 Ubuntu host to cross-compile arm64 binaries. The
# arm64 dev libraries are installed as :arm64 multiarch packages so
# the cross-toolchain finds them at /usr/lib/aarch64-linux-gnu/.

# Cross-toolchain + host-side build tools
sudo apt-get install -y \
    gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
    crossbuild-essential-arm64 \
    make autoconf libtool

# Enable arm64 multiarch (no-op if already enabled)
sudo dpkg --add-architecture arm64
sudo apt-get update -qq

# arm64 dev libs needed by Qt cross-compile (configure probes for
# system freetype/fontconfig/x11/xcb). The :arm64 suffix selects the
# foreign-arch package version.
sudo apt-get install -y \
    libfreetype-dev:arm64 \
    libfontconfig1-dev:arm64 \
    libx11-dev:arm64 \
    libx11-xcb-dev:arm64 \
    libxcb1-dev:arm64 \
    libxext-dev:arm64 \
    libxfixes-dev:arm64 \
    libxi-dev:arm64 \
    libxrender-dev:arm64 \
    libxkbcommon-dev:arm64 \
    libxkbcommon-x11-dev:arm64 \
    libxcb-glx0-dev:arm64 \
    libxcb-keysyms1-dev:arm64 \
    libxcb-image0-dev:arm64 \
    libxcb-shm0-dev:arm64 \
    libxcb-icccm4-dev:arm64 \
    libxcb-sync-dev:arm64 \
    libxcb-xfixes0-dev:arm64 \
    libxcb-shape0-dev:arm64 \
    libxcb-randr0-dev:arm64 \
    libxcb-render-util0-dev:arm64 \
    libxcb-util-dev:arm64 \
    libxcb-xinerama0-dev:arm64 \
    libxcb-xkb-dev:arm64
