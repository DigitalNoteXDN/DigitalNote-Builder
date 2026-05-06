#! /usr/bin/bash

brew install bzip2
brew install autoconf
brew install automake
brew install libtool
brew install boost
brew install gmp

# Python modules required by contrib/macdeploy/macdeployqtplus when it builds
# the .dmg bundle. ds_store manipulates .DS_Store inside the dmg; mac_alias
# is a transitive dep. PyPI-only (not available via Homebrew).
# --break-system-packages: Homebrew's Python on macOS 14+ marks itself as
# externally managed (PEP 668); this flag tells pip we know what we're doing.
pip3 install --break-system-packages ds_store mac_alias
