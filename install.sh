#!/bin/bash
set -euo pipefail				# Use Bash strict mode

ROOT=$PWD
LIB_DIR=$ROOT/3p
set +x
# Build all required libraries
if [[ ! -d 3p ]]; then
	git clone https://github.com/hungptit/build.git $LIB_DIR
fi
pushd 3p
git submodule init
git submodule update
# ./build_all.sh || true
# ./build_rocksdb.sh || true
./build_boost.sh || true
popd

# Build utils
if [[ ! -d utils ]]; then
	git clone https://github.com/hungptit/utils.git
fi
pushd utils
git pull
./install.sh $LIB_DIR
popd

# Build ioutils
if [[ ! -d ioutils ]]; then
	git clone https://github.com/hungptit/ioutils.git
fi
pushd ioutils
git pull
./install.sh $LIB_DIR
pushd command
cmake ./
make -j5
make install
popd

# Build code search
if [[ ! -d codesearch ]]; then
	git clone https://github.com/hungptit/codesearch.git
fi
pushd codesearch
git pull
pushd command
cmake ./
make -j5
make install
popd
popd

# fastgrep
if [[ ! -d fastgrep ]]; then
	git clone https://github.com/hungptit/fastgrep.git
fi

set -x
