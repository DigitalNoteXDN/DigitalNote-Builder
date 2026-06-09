#! /usr/bin/env bash
# Install all apt packages needed for a manual Linux x64 build.
# Matches the CI's package list (see .github/workflows/ci-linux-x64.yml
# in DigitalNote-2). Keep these in sync — divergence between manual
# and CI flows causes mysterious "library X not found" errors that
# only trigger in one place.

set -e

sudo apt-get update

sudo apt-get install -y build-essential gcc g++ make autoconf automake libtool pkg-config
sudo apt-get install -y wget xz-utils

# GMP: Builder doesn't compile GMP on Linux x64 (unlike macOS/aarch64).
# The system package provides /usr/lib/x86_64-linux-gnu/libgmp.a which
# DigitalNote_config.pri references directly.
sudo apt-get install -y libgmp-dev

sudo apt-get install -y libfreetype6 libfreetype6-dev libfreetype-dev
sudo apt-get install -y libfontconfig1 libfontconfig1-dev
sudo apt-get install -y libx11-dev libx11-xcb-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libxcb-glx0-dev libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-util-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
sudo apt-get install -y libdbus-1-dev