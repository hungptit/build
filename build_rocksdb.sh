#!/bin/bash
source ./get_build_options.sh
ROCKSDB_DIR="$SRC_DIR/rocksdb"

# Build rocksdb
pushd $ROCKSDB_DIR
git clean -df
make clean
make DEBUG_LEVEL=0 $BUILD_OPTS static_lib EXTRA_CFLAGS="$EXTRA_CFLAGS" EXTRA_CXXFLAGS="${EXTRA_CXXFLAGS}"

# Remove debuging symbols 
osType=$(uname)
case "$osType" in
    "Darwin")
        {
			echo "Do not strip debug symbols in MacOS";
        } ;;
    "Linux")
        {
			strip -g librocksdb.a
        } ;;
    *)
        {
            echo "Unsupported OS, exiting"
            exit
        } ;;
esac
popd;

# Install libraries
cp $ROCKSDB_DIR/librocksdb.a lib/
cp $ROCKSDB_DIR/include/rocksdb include/ -rv 
