# BrowserStack - Build Your App in the Cloud (Step by Step)

## What is BrowserStack?
- Free cloud Mac access (1 hour trial)
- Xcode already installed
- No credit card needed for trial
- Perfect for building your app!

---

## STEP-BY-STEP GUIDE

### STEP 1: Sign Up to BrowserStack

1. **Open your browser**
2. **Go to:** https://www.browserstack.com/app-live
3. **Click "Sign Up Free"** (top right)
4. **Fill in:**
   - Email: Your email
   - Password: Create one
   - Click "Create Account"
5. **Verify email** (check your inbox)
6. **Login to BrowserStack**

---

### STEP 2: Get a Mac in Your Browser

1. **You're now in BrowserStack dashboard**
2. **Look for "Select Device"**
3. **Choose:**
   - OS: **macOS**
   - Version: **Latest** (Sonoma or similar)
4. **Click "Start"**
5. **Wait 30-60 seconds...**
6. **You now have a Mac on your screen!** 🎉

---

### STEP 3: Open Terminal on the Mac

1. **On the remote Mac screen:**
2. **Press: Command + Space** (opens Spotlight search)
3. **Type: "terminal"**
4. **Press Enter**
5. **Terminal window opens**

---

### STEP 4: Clone Your GitHub Repository

In the terminal, copy and paste this:

```bash
cd Desktop
git clone https://github.com/MordomoDoVski/SpotifyApp.git
cd SpotifyApp
```

Press Enter after each line.

**What you should see:**
```
Cloning into 'SpotifyApp'...
Done!
```

---

### STEP 5: Open in Xcode

1. **In the terminal, type:**
```bash
open -a Xcode .
```

2. **Press Enter**
3. **Xcode opens with your project** (wait 30 seconds)
4. **You see your Swift files on the left**

---

### STEP 6: Build the App

1. **In Xcode, go to:** Product → Archive
2. **Wait for it to finish** (2-5 minutes)
   - You'll see "Archive Successful" message
3. **When done, the Organizer window opens**

---

### STEP 7: Export as .ipa File

1. **In the Organizer window:**
2. **Click on your archive** (should be selected)
3. **Click "Distribute App"** (button on right)
4. **Select: "Custom"** → **"Next"**
5. **Select: "Release"** → **"Next"**
6. **Select your signing method** → **"Next"**
7. **Click "Export"**
8. **Choose where to save** (Desktop is fine)
9. **Click "Save"**
10. **Wait for export to complete** (1-2 minutes)

**You now have:** `SpotifyMusic.ipa` file on Desktop! ✅

---

### STEP 8: Download the .ipa to Your Computer

1. **On the BrowserStack Mac screen:**
2. **Find your Desktop**
3. **Look for "SpotifyMusic.ipa"**
4. **Right-click it**
5. **Select "Download"** (or similar)
6. **Wait for download to start**
7. **Your file downloads to your Windows computer!**

**File location on your Windows PC:**
```
C:\Users\Almeida Neto Daniel\Downloads\SpotifyMusic.ipa
```

---

### STEP 9: Upload to DIAWI

Now you have the .ipa file on your Windows PC!

1. **Go to:** https://www.diawi.com
2. **Drag your .ipa file onto the page**
   - Or click "Upload" button
3. **Wait for processing** (shows progress bar)
4. **You get a link** like: `https://diawi.com/ABC123XYZ`
5. **Copy this link**

---

### STEP 10: Install on Your iPhone

1. **On your iPhone, open Safari**
2. **Paste the DIAWI link in address bar**
3. **Press Enter**
4. **You see your app page**
5. **Tap "Install"**
6. **Confirm installation**
7. **App downloads and installs**
8. **App appears on your home screen!** 🎉

---

## WHAT YOU SHOULD SEE AT EACH STEP

### Terminal (Step 4)
```
MacBook:Desktop user$ cd Desktop
MacBook:Desktop user$ git clone https://github.com/MordomoDoVski/SpotifyApp.git
Cloning into 'SpotifyApp'...
remote: Enumerating objects: 45, done.
Done!
MacBook:SpotifyApp user$ 
```

### Xcode (Step 5)
```
You see your Swift files:
- SpotifyMusicApp.swift
- Models/
- Services/
- Views/
- Utils/
```

### Archive Complete (Step 6)
```
✓ Archive Successful
[Show in Finder] [Distribute App] [Done]
```

### DIAWI Upload (Step 9)
```
Upload progress: 100%
✓ Upload Successful

Your app link:
https://diawi.com/ABC123XYZ
```

### iPhone Installation (Step 10)
```
Safari → Paste link → Enter
↓
"Install Spotify Music App"
↓
"Installing..."
↓
✓ Installed
↓
App on home screen!
```

---

## TIMING

| Step | Time |
|------|------|
| Sign up & Mac setup | 5 min |
| Clone & open Xcode | 3 min |
| Build/Archive | 5 min |
| Export .ipa | 3 min |
| Download to PC | 1 min |
| Upload to DIAWI | 2 min |
| Install on iPhone | 5 min |
| **TOTAL** | **~30 minutes** |

---

## TROUBLESHOOTING

### "Git not found"
- Git is pre-installed on BrowserStack Mac
- Type: `git --version` to verify
- If not installed, run in terminal: `brew install git`

### "Xcode not found"
- Xcode is pre-installed on BrowserStack Mac
- If not: Download from App Store (takes 30+ min)
- Or use BrowserStack's pre-built Xcode image

### "Archive failed"
- Check: Product → Scheme is set to "SpotifyMusicApp"
- Try: Clean Build Folder first (Shift+Cmd+K)
- Then: Product → Archive again

### "Export .ipa failed"
- Make sure you select "Custom" not "App Store"
- Select "Release" build type
- Try "Automatic" signing

### "Can't download .ipa from Mac"
- Right-click on .ipa → "Download to Downloads"
- Or drag to Downloads folder
- BrowserStack auto-downloads to your PC

### "DIAWI upload failed"
- Make sure file is actually .ipa (not .zip)
- Check file size is under 2GB
- Try again, servers are usually fast

### "App won't install on iPhone"
- Make sure link is correct (copy exact URL)
- Try opening in Safari (not Chrome)
- Check iPhone iOS version (needs iOS 15+)
- Delete any old versions first

---

## SUCCESS CHECKLIST

- [ ] Signed up to BrowserStack
- [ ] Got a Mac in the browser
- [ ] Terminal is open
- [ ] Cloned your GitHub repo
- [ ] Xcode opened your project
- [ ] Archive completed successfully
- [ ] Downloaded .ipa file
- [ ] Uploaded to DIAWI
- [ ] Got the DIAWI link
- [ ] Opened link on iPhone Safari
- [ ] App installed on iPhone! ✅

---

## YOU'RE ALMOST DONE!

After these 10 steps:
- ✅ Your app is built
- ✅ Ready to install
- ✅ On your iPhone
- ✅ Working perfectly!

**Let's do this!** 🚀

---

## QUICK REFERENCE

```
BrowserStack URL:
https://www.browserstack.com/app-live

Your GitHub repo:
https://github.com/MordomoDoVski/SpotifyApp

DIAWI upload:
https://www.diawi.com

Commands to copy-paste:

cd Desktop
git clone https://github.com/MordomoDoVski/SpotifyApp.git
cd SpotifyApp
open -a Xcode .
```

---

**Ready to build? Let's go!** 🎵
