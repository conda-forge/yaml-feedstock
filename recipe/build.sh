#!/bin/bash

mkdir build
cd build

cmake ${CMAKE_ARGS} .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib

cmake --build . --config $BUILD_TYPE -- -j$CPU_COUNT
cmake --build . --config $BUILD_TYPE --target install
