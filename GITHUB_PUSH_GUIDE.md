# How to Push Changes to GitHub

This guide explains how to save your changes (like adding new images to the `Img` folder) and upload them to GitHub.

### 🚀 Easiest Way: Use the Automator
I have created a file called `push.bat` in your project folder. You can simply **double-click** it to run all the steps automatically. It will:
1. Update your image catalog (`images.json`).
2. Stage your changes.
3. Ask you for a commit message.
4. Push everything to GitHub.

---

### Manual Method
If you prefer to run the commands yourself, follow these steps:

## Step 1: Update the Image Catalog
If you have added new images to the `Img` folder, you **must** run the build script. This updates the `images.json` file so the website knows the new images exist.

Run this command in your terminal:
```powershell
python build.py
```

## Step 2: Check Your Changes
See what files have been modified or added (you should see your new images and an updated `images.json`).
```powershell
git status
```

## Step 3: Stage Your Changes
Tell Git which files to include in your next update. 

To add **everything** (images + updated catalog):
```powershell
git add .
```

## Step 4: Commit Your Changes
Save a snapshot of your project with a descriptive message.
```powershell
git commit -m "Added new images and updated catalog"
```

## Step 5: Push to GitHub
Upload your changes to the server.
```powershell
git push origin main
```

---

### Quick Summary (The "Four-Step" Workflow)
Whenever you add images, run these in order:
1. `python build.py`
2. `git add .`
3. `git commit -m "Your message"`
4. `git push origin main`

### Common Tips
- **Frequency**: Push your changes often so you don't lose work.
- **Messages**: Make your commit messages descriptive (e.g., "Updated index.html layout" or "Added 5 new muscle images").
- **Verification**: After pushing, you can visit [your repository on GitHub](https://github.com/AnatFiles/anat-learn) to see the changes online.
