#!/bin/bash

# 🎵 Spotify Music App - Automated Deployment Script
# This script automates GitHub deployment and iPhone installation

echo "🎵 Spotify Music App - Automated Deployment"
echo "=========================================="
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
GITHUB_USERNAME="${1:-YOUR_USERNAME}"
REPO_NAME="SpotifyMusicApp"
GITHUB_URL="https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"

echo -e "${BLUE}Step 1: Initialize Git Repository${NC}"
echo "=================================="

# Initialize git if not already done
if [ ! -d ".git" ]; then
    git init
    echo -e "${GREEN}✓ Git initialized${NC}"
else
    echo -e "${GREEN}✓ Git already initialized${NC}"
fi

echo ""
echo -e "${BLUE}Step 2: Configure Git${NC}"
echo "====================="

# Configure git (replace with your info)
git config user.email "your.email@example.com"
git config user.name "Your Name"
echo -e "${GREEN}✓ Git configured${NC}"

echo ""
echo -e "${BLUE}Step 3: Add All Files${NC}"
echo "====================="

git add .
echo -e "${GREEN}✓ All files added${NC}"

echo ""
echo -e "${BLUE}Step 4: Create Initial Commit${NC}"
echo "=============================="

git commit -m "🎵 Initial commit: Spotify Music App with offline support and YouTube integration"
echo -e "${GREEN}✓ Initial commit created${NC}"

echo ""
echo -e "${BLUE}Step 5: Add Remote Repository${NC}"
echo "============================="

# Remove existing remote if any
git remote remove origin 2>/dev/null || true

# Add new remote
git remote add origin "$GITHUB_URL"
echo -e "${GREEN}✓ Remote repository added${NC}"
echo "Repository: $GITHUB_URL"

echo ""
echo -e "${BLUE}Step 6: Push to GitHub${NC}"
echo "======================="

# Set main branch
git branch -M main

echo "Pushing to GitHub..."
echo "Note: You'll need to enter your GitHub credentials"
echo ""

git push -u origin main

echo ""
echo -e "${GREEN}✓ Successfully pushed to GitHub!${NC}"
echo ""
echo "Your GitHub repository is now live at:"
echo "https://github.com/${GITHUB_USERNAME}/${REPO_NAME}"
echo ""

echo -e "${BLUE}Step 7: Next Steps for iPhone Installation${NC}"
echo "=========================================="
echo ""
echo "To install on your iPhone, choose one method:"
echo ""
echo "METHOD 1: Using Xcode (Direct)"
echo "  1. Open Xcode"
echo "  2. File → Open → Select SpotifyMusicApp folder"
echo "  3. Connect your iPhone via USB"
echo "  4. Trust the computer on iPhone"
echo "  5. Select your iPhone in top left"
echo "  6. Press ⌘R to build and run"
echo ""
echo "METHOD 2: Using DIAWI (Web)"
echo "  1. Open Xcode"
echo "  2. Product → Archive"
echo "  3. Choose Generic iOS Device"
echo "  4. Validate & Export as .ipa"
echo "  5. Go to diawi.com"
echo "  6. Upload the .ipa file"
echo "  7. Share the link with your iPhone"
echo "  8. Click link on iPhone to install"
echo ""
echo "METHOD 3: Using AltStore"
echo "  1. Download AltStore from altstore.io"
echo "  2. Add your GitHub repo to AltStore"
echo "  3. Open on iPhone"
echo "  4. Tap Install"
echo ""

echo -e "${GREEN}🎉 Deployment script complete!${NC}"
echo ""
echo "View your repository:"
echo "https://github.com/${GITHUB_USERNAME}/${REPO_NAME}"
