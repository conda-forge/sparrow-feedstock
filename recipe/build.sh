#!/bin/bash

if [[ "$PKG_NAME" == "sparrow" ]]; then
      cmake ${CMAKE_ARGS} -DBUILD_TESTS=OFF \
            -DCMAKE_INSTALL_PREFIX=$PREFIX \
            -DCMAKE_INSTALL_LIBDIR=lib \
            $SRC_DIR
fi
if [[ "$PKG_NAME" == "sparrow-dev" ]]; then
      cmake ${CMAKE_ARGS} -DBUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCREATE_JSON_READER_TARGET=ON \
      $SRC_DIR
fi
make install

