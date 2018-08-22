#!/bin/bash
source ./get_build_options.sh
ROCKSDB_DIR="$SRC_DIR/rocksdb"

# Build rocksdb
pushd $ROCKSDB_DIR
git clean -df
make clean
make DEBUG_LEVEL=0 $BUILD_OPTS static_lib EXTRA_CFLAGS="$EXTRA_CFLAGS" EXTRA_CXXFLAGS="${EXTRA_CXXFLAGS}"
popd

# Install libraries
cp $ROCKSDB_DIR/librocksdb.a lib/
cp -rv $ROCKSDB_DIR/include/rocksdb include/

# TODO: Does not work with compression on.
# ./build_using_cmake.sh rocksdb "-DWITH_TESTS=OFF -DWITH_LZ4=OFF -DWITH_BZ2=OFF -DWITH_ZLIB=OFF -DWITH_ZSTD=OFF -DWITH_SNAPPY=OFF -DWITH_JEMALLOC=OFF -DCMAKE_INSTALL_LIBDIR=lib"

