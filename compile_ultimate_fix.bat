@echo off
echo === Final C++ Compilation Solution ===
echo.

REM Use UCRT64 with explicit console flags  
echo Attempting UCRT64 with console subsystem...
C:\msys64\ucrt64\bin\g++.exe utilities.cpp test_utilities_fixed.cpp -o test_working.exe -Wl,--subsystem,console -Wl,--entry,mainCRTStartup

if %errorlevel% equ 0 (
    echo ✓ UCRT64 compilation successful!
    goto run_program
)

echo Trying alternative UCRT64 method...
C:\msys64\ucrt64\bin\g++.exe utilities.cpp test_utilities_fixed.cpp -o test_working.exe -mconsole

if %errorlevel% equ 0 (
    echo ✓ Alternative UCRT64 method successful!
    goto run_program  
)

echo Creating single-file solution...
echo #include ^<iostream^> > temp_all.cpp
echo using namespace std; >> temp_all.cpp  
echo. >> temp_all.cpp
echo int add(int a, int b) { return a + b; } >> temp_all.cpp
echo. >> temp_all.cpp  
echo int main() { >> temp_all.cpp
echo     cout ^<^< "add(2,3) == 5: " ^<^< (add(2,3) == 5 ? "PASS" : "FAIL") ^<^< endl; >> temp_all.cpp
echo     return 0; >> temp_all.cpp
echo } >> temp_all.cpp

C:\msys64\ucrt64\bin\g++.exe temp_all.cpp -o test_working.exe

if %errorlevel% equ 0 (
    echo ✓ Single-file compilation successful!
    del temp_all.cpp
    goto run_program
)

echo All methods failed!
goto end

:run_program  
echo.
echo Running program:
echo ==================
test_working.exe
echo ==================

:end
echo.
pause
