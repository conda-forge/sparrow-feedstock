#!/bin/bash

set -euxo pipefail

if [[ $PKG_NAME == "sparrow-json-reader" ]]; then
    cmake ${CMAKE_ARGS} \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCREATE_JSON_READER_TARGET=ON \
        $SRC_DIR
else
    cmake ${CMAKE_ARGS} \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCREATE_JSON_READER_TARGET=OFF \
        $SRC_DIR
fi

make -j${CPU_COUNT} install
