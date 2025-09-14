@echo off
echo === C++ Multi-file Compiler (FIXED) ===
echo.

REM Set UCRT64 PATH
set PATH=C:\msys64\ucrt64\bin;%PATH%

REM Check if files exist
if not exist "utilities.cpp" (
    echo Error: utilities.cpp not found!
    pause
    exit /b 1
)

if not exist "test_utilities.cpp" (
    echo Error: test_utilities.cpp not found!  
    pause
    exit /b 1
)

if not exist "utilities.h" (
    echo Error: utilities.h not found!
    pause  
    exit /b 1
)

echo Compiling with UCRT64 g++...
echo Command: g++.exe utilities.cpp test_utilities.cpp -o test_multi.exe

g++.exe utilities.cpp test_utilities.cpp -o test_multi.exe

if %errorlevel% equ 0 (
    echo.
    echo ✓ Compilation successful!
    if exist "test_multi.exe" (
        echo ✓ Executable created: test_multi.exe
        echo.
        echo Running program:
        echo ==================
        test_multi.exe
    ) else (
        echo × Executable not found despite successful compilation
    )
) else (
    echo × Compilation failed with error code: %errorlevel%
)

echo.
pause
