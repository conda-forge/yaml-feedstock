#!/bin/bash

mkdir build
cd build

cmake ${CMAKE_ARGS} .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_INSTALL_LIBDIR=lib

cmake --build . --config Release -- -j$CPU_COUNT
cmake --build . --config Release --target install

if [[ "${build_platform}" == "linux-64" ]]; then
  patchelf --set-soname libyaml-0.so.2 $PREFIX/lib/libyaml.so
fi
