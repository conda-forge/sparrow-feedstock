cmake -G "NMake Makefiles" -D CMAKE_BUILD_TYPE=Release -D BUILD_TESTS=OFF -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% %SRC_DIR% -D USE_LARGE_INT_PLACEHOLDERS=ON -D CREATE_JSON_READER_TARGET=ON
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
