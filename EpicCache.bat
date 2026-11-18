@echo off
title Epic Games Launcher Cache Cleaner
cls

echo ==========================================
echo     EPIC GAMES LAUNCHER CACHE CLEANER
echo ==========================================
echo.

echo Starting...
timeout /t 3 /nobreak >nul
cls

echo Checking Epic Games Launcher...

tasklist /FI "IMAGENAME eq EpicGamesLauncher.exe" 2>NUL | find /I "EpicGamesLauncher.exe" >NUL

if %ERRORLEVEL% EQU 0 (
    timeout /t 3 /nobreak >nul
    echo Epic Games Launcher is running!
    cls
    echo Shutting down Epic Games Launcher...
    taskkill /F /IM EpicGamesLauncher.exe >nul 2>&1
    timeout /t 3 /nobreak >nul
) else (
    echo Epic Games Launcher is already closed!
)

cls
echo ==========================================
echo   Deleting Epic Games Launcher WebCache
echo ==========================================
echo.

set "CACHE=%LOCALAPPDATA%\EpicGamesLauncher\Saved"

if exist "%CACHE%" (
    for /d %%D in ("%CACHE%\webcache_*") do (
        if exist "%%D" (
            echo Deleting: %%~nxD
            rd /s /q "%%D"
        )
    )
    echo.
    echo Cache cleanup completed!
) else (
    echo Cache directory not found. Skipping...
)

echo.
timeout /t 3 /nobreak >nul

set "LAUNCHER=C:\Program Files\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe"

cls
echo Starting Epic Games Launcher...

if exist "%LAUNCHER%" (
    start "" "%LAUNCHER%"
    echo Launcher started successfully!
) else (
    echo ERROR: Epic Games Launcher executable not found!
)

echo.
timeout /t 3 /nobreak >nul

echo ==========================================
echo             PROCESS FINISHED!
echo ==========================================

timeout /t 5
exit