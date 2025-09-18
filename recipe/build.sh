#!/bin/bash

set -euxo pipefail

cmake ${CMAKE_ARGS} \
    -DBUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCREATE_JSON_READER_TARGET=ON \
    $SRC_DIR

make install
