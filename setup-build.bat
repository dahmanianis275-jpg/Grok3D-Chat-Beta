@echo off
title Grok3D Chat Assistant - Build Setup
echo.
echo  ========================================
echo   Grok3D Chat Assistant - Free Beta
echo   Building Windows EXE / Setup
echo  ========================================
echo.
echo  This will install dependencies and create
echo  the installer + portable executable.
echo.
echo  Requirements: Node.js installed
echo.
pause

where node >nul 2>nul
if %errorlevel% neq 0 (
  echo ERROR: Node.js is not installed or not in PATH.
  echo Download from https://nodejs.org
  pause
  exit /b 1
)

echo.
echo [1/3] Installing npm packages...
call npm install
if %errorlevel% neq 0 (
  echo npm install failed.
  pause
  exit /b 1
)

echo.
echo [2/3] Note: For a proper icon, convert assets\icon.svg to assets\icon.ico
echo       (you can skip this - Electron will still build)
echo.

echo [3/3] Building Windows installer + portable EXE...
call npm run dist
if %errorlevel% neq 0 (
  echo Build failed. Check the error above.
  pause
  exit /b 1
)

echo.
echo  ========================================
echo   DONE!
echo   Look in the "dist" folder for:
echo   - Setup installer (.exe)
echo   - Portable EXE
echo  ========================================
echo.
echo  The app points to the 3D face ChatGPT-style
echo  assistant (index.html). It is free software
echo  and not a real human responder.
echo.
pause
