@echo off
:: MVSC++ Compiler options list: https://docs.microsoft.com/en-us/cpp/build/reference/compiler-options-listed-by-category?view=vs-2019
:: VS : set the path to your Visual Studio installation. needed to setup environment varibles to be able to compile with mvsc++
SET VS=C:\Program Files (x86)\Microsoft Visual Studio\2017
CALL "%VS%\Community\VC\Auxiliary\Build\vcvars64.bat"

:: Set release or debug mode
SET COMPILE_MODE=debug

SET SRC=..\src\main.c
SET NAME="my_prog.exe"

IF "%COMPILE_MODE%"=="release" (
    SET CFLAGS= /MT /FC /MP /nologo
)

IF "%COMPILE_MODE%"=="debug" (
    SET CFLAGS= /Zi /MTd /FC /MP /nologo
)

SET LINK_OPTS= /link /out:%NAME%

mkdir build
pushd build

cl.exe %CFLAGS% %SRC% %LINK_OPTS%

popd build