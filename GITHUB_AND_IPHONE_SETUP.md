# GitHub Setup Guide

## Push Your App to GitHub

### Step 1: Create GitHub Repository

1. Go to [GitHub.com](https://github.com)
2. Click **"New"** to create new repository
3. Name: `SpotifyMusicApp`
4. Description: `iOS Music Player App with Offline Support`
5. Choose **Public** (for free hosting)
6. Click **"Create repository"**

### Step 2: Initialize Git Locally

```bash
cd /path/to/SpotifyMusicApp

# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Spotify Music App"

# Add remote repository
git remote add origin https://github.com/YOUR_USERNAME/SpotifyMusicApp.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Update GitHub Config

Edit `Services/GitHubConfig.swift`:
```swift
static let repositoryURL = "https://github.com/YOUR_USERNAME/SpotifyMusicApp"
```

Replace `YOUR_USERNAME` with your actual GitHub username.

---

## Download App on iPhone

### Option 1: Using Xcode (Direct Installation)

1. **Open Project in Xcode**
   - Open Xcode
   - File → Open → Select project folder

2. **Connect iPhone**
   - Plug in iPhone via USB
   - Trust the computer

3. **Select Device**
   - Top left of Xcode: Select your iPhone
   - Verify device shows up

4. **Sign Code**
   - Xcode → Signing & Capabilities
   - Select your Apple ID
   - Let Xcode handle signing

5. **Build & Run**
   - Press ⌘R
   - App installs on your iPhone!

### Option 2: Using TestFlight (Free Distribution)

TestFlight allows you to distribute to up to 100 testers for free.

#### Requirements
- Apple Developer Account ($99/year)
- Or free tier (limited)

#### Steps

1. **Enroll in App Store Connect**
   - Go to [appstoreconnect.apple.com](https://appstoreconnect.apple.com)
   - Sign in with Apple ID

2. **Create App**
   - My Apps → "+"
   - New App
   - Bundle ID: `com.yourname.spotifymusic`

3. **Archive App**
   - Xcode: Product → Archive
   - Validate & Submit

4. **Add TestFlight Testers**
   - Add your iPhone email
   - Send invite link

5. **Download via TestFlight**
   - Open TestFlight app on iPhone
   - Install app from TestFlight

### Option 3: GitHub Releases (No Apple Account)

Create installable builds and share via GitHub.

1. **Add Release Info to Package**
   - Create `Info.plist` with app details
   - Create `.ipa` file (iOS app package)

2. **Push to GitHub Releases**
   - Create release on GitHub
   - Upload `.ipa` file
   - Share release link

3. **Install from Link**
   - Users can download via [AppBox](https://www.appboxhq.com/)
   - Or use [diawi](https://www.diawi.com/)

---

## Free Hosting & Distribution

### GitHub Pages (Free)

Host your project documentation:

1. **Enable GitHub Pages**
   - Repository Settings
   - Pages section
   - Select `main` branch
   - Save

2. **Your site**
   - `https://YOUR_USERNAME.github.io/SpotifyMusicApp`

### GitHub Releases (Free App Distribution)

1. Create Release
   - Releases → New Release
   - Tag: `v1.0.0`
   - Upload `.ipa` file
   - Publish

2. Share Link
   - Users can download directly

---

## Best Free Options

### ✅ Best Option 1: Xcode Direct
- No cost
- Works on your own iPhone
- Quick development
- Perfect for testing

### ✅ Best Option 2: GitHub + DIAWI
- Completely free
- Share link with friends
- No Apple account needed
- Works on any iPhone

**How to use DIAWI:**
1. Build `.ipa` in Xcode
2. Go to [diawi.com](https://www.diawi.com/)
3. Upload `.ipa` file
4. Get shareable link
5. Send link to friends
6. They can install on their iPhone!

### ✅ Best Option 3: Testflight (Free Tier)
- Up to 100 testers
- Requires Apple ID (free)
- Official Apple method
- Most reliable

---

## Step-by-Step: Upload to GitHub

### 1. Install Git (if needed)

**On Mac:**
```bash
brew install git
```

**On Windows:**
Download from [git-scm.com](https://git-scm.com/download/win)

### 2. Navigate to Project

```bash
cd /path/to/SpotifyMusicApp
```

### 3. Initialize Repository

```bash
git init
git add .
git commit -m "Initial commit"
```

### 4. Create GitHub Repository

Go to [github.com/new](https://github.com/new)

### 5. Connect & Push

```bash
git remote add origin https://github.com/YOUR_USERNAME/SpotifyMusicApp.git
git branch -M main
git push -u origin main
```

### 6. View on GitHub

Visit: `https://github.com/YOUR_USERNAME/SpotifyMusicApp`

---

## Installation Links to Share

Once on GitHub:

1. **Repository**: `https://github.com/YOUR_USERNAME/SpotifyMusicApp`
2. **Clone Link**: `https://github.com/YOUR_USERNAME/SpotifyMusicApp.git`
3. **Releases**: `https://github.com/YOUR_USERNAME/SpotifyMusicApp/releases`

---

## Free Alternatives to App Store

| Method | Cost | Requirement | Best For |
|--------|------|-------------|----------|
| Xcode Direct | Free | Mac + iPhone cable | Personal use |
| TestFlight | Free | Apple ID | Beta testing |
| GitHub + DIAWI | Free | GitHub account | Sharing with friends |
| GitHub Releases | Free | GitHub account | Public releases |
| Altstore | Free | GitHub | No computer needed |

---

## AltStore (iPhone Only, No Computer!)

Install directly on iPhone without computer:

1. Go to [altstore.io](https://altstore.io)
2. Download AltStore
3. Sideload your app via GitHub
4. Install on iPhone!

---

## Complete Free Workflow

```
Step 1: Build app in Xcode
           ↓
Step 2: Create GitHub repo
           ↓
Step 3: Push code to GitHub
           ↓
Step 4: Create release with .ipa
           ↓
Step 5: Share GitHub link
           ↓
Step 6: Others install via DIAWI or AltStore
```

**Total Cost: $0!** 🎉

---

## Next Steps

1. ✅ Create GitHub account (free)
2. ✅ Create new repository
3. ✅ Push your code
4. ✅ Build `.ipa` file
5. ✅ Upload to releases
6. ✅ Share link!

Your app is now free to distribute! 🚀
