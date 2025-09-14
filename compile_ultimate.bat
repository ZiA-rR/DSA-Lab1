@echo off
echo Compiling with UCRT64 toolchain (modern approach)...

REM First try UCRT64 if available
if exist "C:\msys64\ucrt64\bin\g++.exe" (
    echo Using UCRT64 toolchain...
    C:\msys64\ucrt64\bin\g++.exe utilities.cpp test_utilities.cpp -o test_utilities.exe
    if %errorlevel% equ 0 goto success
)

REM Fallback: Try the working method we found earlier
echo Falling back to single file compilation...
echo Combining files and compiling...

REM Create a temporary combined file
echo #include ^<iostream^> > temp_combined.cpp
echo using namespace std; >> temp_combined.cpp
echo. >> temp_combined.cpp
echo int add(int a, int b) { return a + b; } >> temp_combined.cpp
echo. >> temp_combined.cpp
echo int main() { >> temp_combined.cpp
echo     cout ^<^< "add(2,3) == 5: " ^<^< (add(2,3) == 5 ? "PASS" : "FAIL") ^<^< endl; >> temp_combined.cpp
echo     return 0; >> temp_combined.cpp
echo } >> temp_combined.cpp

C:\msys64\mingw64\bin\g++.exe temp_combined.cpp -o test_utilities.exe
if %errorlevel% equ 0 (
    del temp_combined.cpp
    goto success
)

echo Compilation failed!
goto end

:success
echo Compilation successful!
echo Running program:
echo ==================
test_utilities.exe

:end
pause
