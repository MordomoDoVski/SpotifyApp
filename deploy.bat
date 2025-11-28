@echo off
REM 🎵 Spotify Music App - Windows Deployment Script
REM This script deploys to GitHub

setlocal enabledelayedexpansion

echo.
echo 🎵 Spotify Music App - Automated Deployment
echo ==========================================
echo.

REM Configuration
set GITHUB_USERNAME=%1
if "%GITHUB_USERNAME%"=="" (
    echo.
    echo ❌ ERROR: GitHub username required!
    echo.
    echo Usage: deploy.bat YOUR_GITHUB_USERNAME
    echo.
    echo Example: deploy.bat johndoe
    echo.
    pause
    exit /b 1
)

set REPO_NAME=SpotifyMusicApp
set GITHUB_URL=https://github.com/!GITHUB_USERNAME!/!REPO_NAME!.git

echo Step 1: Initialize Git Repository
echo ==================================
echo.

if exist .git (
    echo ✓ Git already initialized
) else (
    git init
    echo ✓ Git initialized
)

echo.
echo Step 2: Configure Git
echo =====================
echo.

git config user.email "your.email@example.com"
git config user.name "Your Name"
echo ✓ Git configured

echo.
echo Step 3: Add All Files
echo =====================
echo.

git add .
echo ✓ All files added

echo.
echo Step 4: Create Initial Commit
echo ==============================
echo.

git commit -m "🎵 Initial commit: Spotify Music App with offline support and YouTube integration"
echo ✓ Initial commit created

echo.
echo Step 5: Add Remote Repository
echo =============================
echo.

git remote remove origin >nul 2>&1
git remote add origin !GITHUB_URL!
echo ✓ Remote repository added
echo Repository: !GITHUB_URL!

echo.
echo Step 6: Push to GitHub
echo ======================
echo.

git branch -M main

echo Pushing to GitHub...
echo Note: You'll need to enter your GitHub credentials
echo.

git push -u origin main

if !errorlevel! equ 0 (
    echo.
    echo ✓ Successfully pushed to GitHub!
    echo.
    echo Your GitHub repository is now live at:
    echo https://github.com/!GITHUB_USERNAME!/!REPO_NAME!
) else (
    echo.
    echo ❌ Error pushing to GitHub
    echo Please check your credentials and try again
    pause
    exit /b 1
)

echo.
echo Step 7: Next Steps for iPhone Installation
echo ==========================================
echo.
echo To install on your iPhone, choose one method:
echo.
echo METHOD 1: Using Xcode (Direct - Easiest!)
echo   1. Open Xcode
echo   2. File → Open → Select SpotifyMusicApp folder
echo   3. Connect your iPhone via USB
echo   4. Trust the computer on iPhone
echo   5. Select your iPhone in top left
echo   6. Press ⌘R to build and run
echo   7. App installs on your iPhone!
echo.
echo METHOD 2: Using DIAWI (Web)
echo   1. Open Xcode
echo   2. Product → Archive
echo   3. Choose Generic iOS Device
echo   4. Validate ^& Export as .ipa
echo   5. Go to diawi.com
echo   6. Upload the .ipa file
echo   7. Share the link with your iPhone
echo   8. Click link on iPhone to install
echo.
echo METHOD 3: Using AltStore
echo   1. Download AltStore from altstore.io
echo   2. Add your GitHub repo to AltStore
echo   3. Open on iPhone
echo   4. Tap Install
echo.

echo ✓ Deployment script complete!
echo.
echo View your repository:
echo https://github.com/!GITHUB_USERNAME!/!REPO_NAME!
echo.

pause
