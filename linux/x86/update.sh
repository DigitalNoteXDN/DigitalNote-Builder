#! /usr/bin/env bash

sudo dpkg --add-architecture i386
sudo apt-get update

sudo apt-get install gcc-multilib g++-multilib make autoconf libtool linux-libc-dev:i386

sudo apt-get install libfreetype6:i386 libfreetype6-dev:i386 libfreetype-dev:i386
sudo apt-get install libfontconfig1:i386 libfontconfig1-dev:i386
sudo apt-get install libx11-dev:i386 libx11-xcb-dev:i386 libxext-dev:i386 libxfixes-dev:i386 libxi-dev:i386 libxrender-dev:i386 libxcb1-dev:i386 libxcb-glx0-dev:i386 libxcb-keysyms1-dev:i386 libxcb-image0-dev:i386 libxcb-shm0-dev:i386 libxcb-icccm4-dev:i386 libxcb-sync-dev:i386 libxcb-xfixes0-dev:i386 libxcb-shape0-dev:i386 libxcb-randr0-dev:i386 libxcb-render-util0-dev:i386 libxcb-xinerama0-dev:i386 libxkbcommon-dev:i386 libxkbcommon-x11-dev:i386
