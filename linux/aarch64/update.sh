#! /usr/bin/env bash

sudo dpkg --add-architecture arm64
sudo apt-get update

sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu make autoconf libtool

#sudo apt-get install linux-libc-dev:arm64
#sudo apt-get install libfreetype6:arm64 libfreetype6-dev:arm64 libfreetype-dev:arm64
#sudo apt-get install libfontconfig1:arm64 libfontconfig1-dev:arm64
#sudo apt-get install libx11-dev:arm64 libx11-xcb-dev:arm64 libxext-dev:arm64 libxfixes-dev:arm64 libxi-dev:arm64 libxrender-dev:arm64 libxcb1-dev:arm64 libxcb-glx0-dev:arm64 libxcb-keysyms1-dev:arm64 libxcb-image0-dev:arm64 libxcb-shm0-dev:arm64 libxcb-icccm4-dev:arm64 libxcb-sync-dev:arm64 libxcb-xfixes0-dev:arm64 libxcb-shape0-dev:arm64 libxcb-randr0-dev:arm64 libxcb-render-util0-dev:arm64 libxcb-xinerama0-dev:arm64 libxkbcommon-dev:arm64 libxkbcommon-x11-dev:arm64


