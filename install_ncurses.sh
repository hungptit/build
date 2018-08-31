#!/bin/bash
set -euo pipefail

# Download source code if needed.
pushd src/
rm -rf ncurses*
tar_file=ncurses.tar.gz
if [[ ! -f $tar_file ]]; then
    wget https://invisible-island.net/datafiles/current/$tar_file
fi

# Unpack source code
tar xf $tar_file
popd

# Build ncurses
./build_using_configure.sh ncurses-6.1-20180825
