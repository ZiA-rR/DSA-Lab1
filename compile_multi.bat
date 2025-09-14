@echo off
echo Compiling multiple C++ files...

REM Method 1: Try with explicit console subsystem
echo Trying method 1: Console subsystem...
C:\msys64\mingw64\bin\g++.exe -Wl,--entry=mainCRTStartup -Wl,--subsystem=console utilities.cpp test_utilities.cpp -o test_utilities.exe 2>nul
if %errorlevel% equ 0 goto success1

REM Method 2: Try with different entry point
echo Trying method 2: Different entry point...
C:\msys64\mingw64\bin\g++.exe -e mainCRTStartup utilities.cpp test_utilities.cpp -o test_utilities.exe 2>nul
if %errorlevel% equ 0 goto success1

REM Method 3: Try with mingw32 prefix
echo Trying method 3: Alternative linking...
C:\msys64\mingw64\bin\g++.exe -municode utilities.cpp test_utilities.cpp -o test_utilities.exe 2>nul
if %errorlevel% equ 0 goto success1

echo All methods failed. Installing UCRT64 toolchain is recommended.
goto end

:success1
echo Compilation successful!
echo Running program:
echo ==================
test_utilities.exe

:end
pause
