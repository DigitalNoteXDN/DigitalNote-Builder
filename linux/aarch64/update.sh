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

# Configure apt for arm64 multiarch.
# Ubuntu's main archive hosts only amd64/i386 — arm64 packages live on
# ports.ubuntu.com. Constrain existing sources to amd64 (handling both
# old-style .list files and the deb822 .sources format used by Ubuntu
# 22.04+) and add arm64 sources pointing at ports.
#
# Patch one-line .list format
sudo sed -i -E 's|^(deb )(\[[^]]*\] )?(http)|\1[arch=amd64] \3|' /etc/apt/sources.list 2>/dev/null || true
for f in /etc/apt/sources.list.d/*.list; do
    [ -e "$f" ] || continue
    sudo sed -i -E 's|^(deb )(\[[^]]*\] )?(http)|\1[arch=amd64] \3|' "$f"
done
# Patch deb822 .sources format
for f in /etc/apt/sources.list.d/*.sources; do
    [ -e "$f" ] || continue
    if ! grep -q '^Architectures:' "$f"; then
        sudo sed -i '/^Types:/a Architectures: amd64' "$f"
    fi
done
# Add arm64 ports sources (auto-detect codename)
CODENAME=$(. /etc/os-release && echo "$VERSION_CODENAME")
printf '%s\n' \
    "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ ${CODENAME} main restricted universe multiverse" \
    "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ ${CODENAME}-updates main restricted universe multiverse" \
    "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ ${CODENAME}-backports main restricted universe multiverse" \
    "deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ ${CODENAME}-security main restricted universe multiverse" \
    | sudo tee /etc/apt/sources.list.d/arm64-ports.list >/dev/null

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
