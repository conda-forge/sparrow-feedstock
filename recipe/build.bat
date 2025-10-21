@echo ON

if /I "%PKG_NAME%" == "sparrow" (
    cmake -B build-release/ ^
        -G "Ninja" ^
        -D CMAKE_BUILD_TYPE=Release ^
        -D BUILD_TESTS=OFF ^
        -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
        -D USE_LARGE_INT_PLACEHOLDERS=ON ^
        -D CREATE_JSON_READER_TARGET=OFF ^
        %SRC_DIR%
    if errorlevel 1 exit 1
    cmake --build build-release/ --parallel %CPU_COUNT%
    if errorlevel 1 exit 1
    cmake --install build-release/
    if errorlevel 1 exit 1
)
if /I "%PKG_NAME%" == "sparrow-devel" (

    cmake -B build-debug/ ^
        -G "Ninja" ^
        -D CMAKE_BUILD_TYPE=Debug ^
        -D BUILD_TESTS=OFF ^
        -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%\debug ^
        -D USE_LARGE_INT_PLACEHOLDERS=ON ^
        -D CREATE_JSON_READER_TARGET=OFF ^
        %SRC_DIR%
    if errorlevel 1 exit 1
    cmake --build build-debug/ --parallel %CPU_COUNT%
    if errorlevel 1 exit 1
    cmake --install build-debug/
    if errorlevel 1 exit 1
)

if /I "%PKG_NAME%" == "sparrow-json-reader" (

    cmake -B build-release/ ^
        -G "Ninja" ^
        -D CMAKE_BUILD_TYPE=Release ^
        -D BUILD_TESTS=OFF ^
        -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
        -D USE_LARGE_INT_PLACEHOLDERS=ON ^
        -D CREATE_JSON_READER_TARGET=ON ^
        %SRC_DIR%
    if errorlevel 1 exit 1
    cmake -B build-debug/ ^
        -G "Ninja" ^
        -D CMAKE_BUILD_TYPE=Debug ^
        -D BUILD_TESTS=OFF ^
        -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%\debug ^
        -D USE_LARGE_INT_PLACEHOLDERS=ON ^
        -D CREATE_JSON_READER_TARGET=ON ^
        %SRC_DIR%
    if errorlevel 1 exit 1
    cmake --build build-release/ --parallel %CPU_COUNT%
    if errorlevel 1 exit 1
    cmake --install build-release/
    if errorlevel 1 exit 1
    cmake --build build-debug/ --parallel %CPU_COUNT%
    if errorlevel 1 exit 1
    cmake --install build-debug/
    if errorlevel 1 exit 1
)

