@echo off
setlocal
echo ========================================
echo   GitHub Push Automator
echo ========================================
echo.

:: 1. Run the build script
echo [Step 1] Updating image catalog...
python build.py
if %ERRORLEVEL% NEQ 0 (
    echo [FAILED] Failed to run build.py. Stopping push.
    pause
    exit /b %ERRORLEVEL%
)
echo [DONE] images.json updated.
echo.

:: 2. Stage changes
echo [Step 2] Staging changes...
git add .
echo [DONE] Changes staged.
echo.

:: 3. Get commit message
echo [Step 3] Preparing commit...
set "msg=Updated images and catalog"
set /p userMsg="Enter a commit message (or press Enter for default: %msg%): "
if not "%userMsg%"=="" set "msg=%userMsg%"

:: 4. Commit
echo [Step 4] Committing changes...
git commit -m "%msg%"
echo.

:: 5. Push
echo [Step 5] Pushing to GitHub (main)...
git push origin main
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [FAILED] Push failed. Make sure you are connected to the internet and have permission to push.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo ========================================
echo   SUCCESS: Changes are now on GitHub!
echo   Your Netlify site should update soon.
echo ========================================
echo.
pause
endlocal
