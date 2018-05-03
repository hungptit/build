#!/bin/bash
set -euo pipefail				# Use Bash strict mode


printf "Build CMake\n";
./build_using_cmake.sh CMake > /dev/null

printf "Build Catch\n";
./build_using_cmake.sh Catch2

printf "Build fmt\n"
./build_using_cmake.sh fmt "-DFMT_DOC=OFF -DFMT_TEST=OFF" > /dev/null

printf "Build Celero\n"
./build_using_cmake.sh Celero "-DCELERO_COMPILE_DYNAMIC_LIBRARIES:BOOL=OFF -DCELERO_ENABLE_EXPERIMENTS:BOOL=OFF" > /dev/null

printf "Build cereal\n"
./build_using_cmake.sh cereal "-DJUST_INSTALL_CEREAL=TRUE" > /dev/null 

printf "Build spdlog\n"
./build_using_cmake.sh spdlog > /dev/null 

printf "Build libzmq\n"
./build_using_cmake.sh libzmq > /dev/null 

printf "Build zlib\n"
./build_using_cmake.sh zlib > /dev/null 

printf "Build lz4\n"
./build_using_make.sh lz4 > /dev/null 

printf "Build jemalloc\n"
./build_using_autogen.sh jemalloc > /dev/null

# Download required packages
# ./download_source_code.sh http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz bzip2
# ./download_source_code.sh http://sqlite.org/2017/sqlite-autoconf-3180000.tar.gz

# printf "Build SQLite"
# ./build_using_configure.sh sqlite "CFLAGS=-O3"

# printf "Build bzip2\n"
# ./build_using_make.sh bzip2 > /dev/null 

printf "build rocksdb"
./build_rocksdb.sh > /dev/null 
