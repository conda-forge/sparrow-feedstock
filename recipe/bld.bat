if [[ $PKG_NAME == "sparrow" ]]; then
    cmake -G "NMake Makefiles" -D BUILD_TESTS=OFF -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% %SRC_DIR% -D USE_LARGE_INT_PLACEHOLDERS=ON
elif [[ $PKG_NAME == "libmambapy" ]]; then
    cmake -G "NMake Makefiles" -D BUILD_TESTS=OFF -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% %SRC_DIR% -D USE_LARGE_INT_PLACEHOLDERS=ON -D CREATE_JSON_READER_TARGET=ON
fi
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
