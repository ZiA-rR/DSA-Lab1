param([string]$filename)

if (-not $filename) {
    Write-Host "Usage: .\run.ps1 filename.cpp" -ForegroundColor Red
    exit 1
}

$basename = [System.IO.Path]::GetFileNameWithoutExtension($filename)

Write-Host "Compiling $filename..." -ForegroundColor Yellow
C:\msys64\mingw64\bin\g++.exe -Wl,--subsystem,console $filename -o "$basename.exe"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Compilation successful! Running program..." -ForegroundColor Green
    Write-Host "==================" -ForegroundColor Cyan
    & ".\$basename.exe"
} else {
    Write-Host "Compilation failed!" -ForegroundColor Red
}
