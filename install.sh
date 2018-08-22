#!/bin/bash
set -euo pipefail				# Use Bash strict mode

# Build all required libraries
if [[! -d 3p ]]; then
	git clone https://github.com/hungptit/build.git 3p
fi
pushd 3p
git submodule init
git submodule update
./build_all.sh 
popd

# Build utils
git clone https://github.com/hungptit/utils.git

# Build ioutils
git clone https://github.com/hungptit/ioutils.git
git clone https://github.com/hungptit/ioutils.git
