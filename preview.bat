@echo off
setlocal
echo ========================================
echo   AnatLearn Local Preview Starter
echo ========================================
echo.

:: 1. Build the images.json
echo [Step 1] Building image list...
python build.py
if %ERRORLEVEL% NEQ 0 (
    echo [FAILED] Failed to build images.json. Check your Img folder.
    pause
    exit /b %ERRORLEVEL%
)
echo [DONE] Image list updated.

echo.

:: 2. Launch Browser
echo [Step 2] Opening local server at http://localhost:8000...
start "" "http://localhost:8000"

:: 3. Start Server
echo [Step 3] Starting Python HTTP Server...
echo (Press Ctrl+C to stop the server)
python -m http.server 8000

endlocal
