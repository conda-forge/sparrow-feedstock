#!/bin/bash

if /I "%PKG_NAME%" == "sparrow" (
      cmake ${CMAKE_ARGS} -DBUILD_TESTS=OFF \
            -DCMAKE_INSTALL_PREFIX=$PREFIX \
            -DCMAKE_INSTALL_LIBDIR=lib \
            $SRC_DIR
)
if /I "%PKG_NAME%" == "sparrow-dev" (
      cmake ${CMAKE_ARGS} -DBUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCREATE_JSON_READER_TARGET=ON \
      $SRC_DIR
)
make install

