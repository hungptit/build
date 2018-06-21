source ./get_build_options.sh
TBB_DIR="$SRC_DIR/tbb"

install_tbb() {
    pushd $TBB_DIR
    make clean

	# Customize some variables to make this build portable.
	make $BUILD_OPTS CXXFLAGS="-O3 -march=native" $BUILD_OPTS
	
	# Copy libraries to lib folder.
	rm -rf lib
	mkdir -p lib
    cp build/linux_intel64_gcc_cc*_release/*.so* lib/
    popd;
}

# Build tbb
install_tbb > /dev/null

# Copy header files and libraries
mkdir -p lib include
cp $TBB_DIR/lib/* lib/
cp -rv $TBB_DIR/include/tbb include/

