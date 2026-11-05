@echo off
chcp 65001 >nul
title Chùa Online TikTok Live - Full Setup & Run

echo.
echo ============================================
echo   CHUA ONLINE TIKTOK LIVE - FULL SETUP
echo ============================================
echo.

cd /d "%~dp0"

echo [1/7] Checking Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Node.js not found. Please install from https://nodejs.org/
    pause
    exit /b 1
) else (
    echo [OK] Node.js found
)

echo.
echo [2/7] Checking Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Python not found. Please install from https://python.org/
    pause
    exit /b 1
) else (
    echo [OK] Python found
)

echo.
echo [3/7] Checking uv...
uv --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] uv not found, installing...
    pip install uv
    if %errorlevel% neq 1 (
        echo [OK] uv installed
    ) else (
        echo [X] Failed to install uv
        pause
        exit /b 1
    )
) else (
    echo [OK] uv found
)

echo.
echo [4/7] Checking Python venv...
if not exist ".venv" (
    echo [!] Python venv not found, creating...
    uv venv .venv
    if errorlevel 1 (
        echo [X] Error creating venv!
        pause
        exit /b 1
    )
    echo [OK] venv created successfully
) else (
    echo [OK] venv exists
)

echo.
echo [5/7] Checking ZeroTTS installation...
.venv\Scripts\python.exe -c "import zerotts" 2>nul
if errorlevel 1 (
    echo [!] ZeroTTS not installed, installing...
    uv pip install --python .venv\Scripts\python.exe zerotts pillow
    if errorlevel 1 (
        echo [X] Error installing ZeroTTS!
        pause
        exit /b 1
    )
    echo [OK] ZeroTTS installed successfully
) else (
    echo [OK] ZeroTTS installed
)

echo.
echo [6/7] Checking Node dependencies...
if not exist "node_modules" (
    echo [!] Node dependencies not found, installing...
    call npm install
    if errorlevel 1 (
        echo [X] Error installing Node dependencies!
        pause
        exit /b 1
    )
    echo [OK] Node dependencies installed
) else (
    echo [OK] Node dependencies exist
)

echo.
echo [7/7] Starting server...
echo.

node server.js

echo.
echo Server stopped.
pause
