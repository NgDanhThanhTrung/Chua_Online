@echo off
chcp 65001 >nul
title CHUA ONLINE - TEST MODE

echo.
echo ============================================
echo   CHUA ONLINE - TEST MODE
echo ============================================
echo.

cd /d "%~dp0"

REM Add paths (no installation)
set "PYTHON_PATH=C:\Users\User\AppData\Local\Programs\Python\Python312"
if exist "%PYTHON_PATH%" (
    set "PATH=%PYTHON_PATH%;%PYTHON_PATH%\Scripts;%PATH%"
)
set "UV_PATH=C:\Users\User\.local\bin"
if exist "%UV_PATH%" (
    set "PATH=%UV_PATH%;%PATH%"
)

echo [1/3] Checking if server is running...
tasklist /FI "IMAGENAME eq node.exe" 2>NUL | find /I /N "node.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [OK] Server is running
) else (
    echo [!] Server not running, starting...
    start /MIN run.bat
    timeout /t 8 /nobreak >nul
    echo [OK] Server started
)

echo.
echo [2/3] Opening Chua Live Screen...
start http://localhost:3000
timeout /t 2 /nobreak >nul

echo [3/3] Opening Admin Panel for username input...
start http://localhost:3000/admin
timeout /t 2 /nobreak >nul

echo.
echo ============================================
echo   TEST MODE READY
echo ============================================
echo.
echo INSTRUCTIONS:
echo.
echo 1. In Admin Panel (http://localhost:3000/admin):
echo    - Enter @username of TikToker currently live
echo    - Click "KET NOI" (Connect)
echo.
echo 2. Watch terminal run.bat to see:
echo    - [TikTok Chat] - Comments
echo    - [TikTok Gift] - Gifts
echo    - [TikTok Like] - Likes
echo    - [TikTok Share] - Follow/Share
echo.
echo 3. Watch Chua Screen (http://localhost:3000):
echo    - See animations for each interaction
echo    - Test buttons: Thap huong, Thap den, Go mo, etc.
echo.
echo 4. To test manually:
echo    - Click buttons in the right panel
echo    - Test: Thap huong, Thap den hoa dang, Xin xam, etc.
echo.
echo TEST MODE ONLY:
echo - NO OBS Studio opened
echo - NO TikTok Live configuration
echo - Just for testing interactions
echo.
echo ============================================
echo.

pause
