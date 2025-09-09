cmake -G "NMake Makefiles" -D BUILD_TESTS=OFF -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% %SRC_DIR% -D USE_LARGE_INT_PLACEHOLDERS=ON
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
