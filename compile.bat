@echo off
echo Compiling starter.cpp with MSYS2 MinGW-w64...
C:\msys64\mingw64\bin\g++.exe starter.cpp -o starter.exe
if %errorlevel% equ 0 (
    echo Compilation successful!
    echo Running program:
    echo ==================
    starter.exe
) else (
    echo Compilation failed!
)
pause
