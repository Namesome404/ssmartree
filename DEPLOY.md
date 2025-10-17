# SmartTree Deployment Guide

## ✅ GitHub Repository
Repository: https://github.com/Namesome404/ssmartree.git

## 🚀 Deploy to Vercel

### Method 1: Via Vercel Dashboard (Recommended)

1. **Go to Vercel**: https://vercel.com
2. **Sign in** with your GitHub account
3. **Click "Add New Project"**
4. **Import** your GitHub repository: `Namesome404/ssmartree`
5. **Configure Project**:
   - **Framework Preset**: Other
   - **Root Directory**: `website`
   - **Build Command**: Leave empty or use `echo "No build needed"`
   - **Output Directory**: Leave as `.` (current directory)
   - **Install Command**: Leave empty
6. **Environment Variables**: None needed
7. **Click "Deploy"**

### Method 2: Via Vercel CLI

```bash
# Install Vercel CLI (if not installed)
npm i -g vercel

# Login to Vercel
vercel login

# Deploy
cd /Users/namesome/Documents/Projects/SmartTree
vercel --prod
```

When prompted:
- Set up and deploy? **Y**
- Which scope? Choose your account
- Link to existing project? **N**
- What's your project's name? **ssmartree**
- In which directory is your code located? **./website**

## 📝 Important Notes

### For the website to work properly on Vercel:

1. **Root Directory**: Set to `website` in Vercel project settings
2. **Flutter Web App**: The app is linked via `website/app` → `build/web`
3. **APK Download**: The Android APK is at `website/downloads/smartTree.apk`

### Vercel Configuration

The `vercel.json` file is configured to:
- Serve the website from the `website` directory
- Route `/app/*` requests to the Flutter web build
- Enable clean URLs

### After Deployment

Your website will be available at:
- Production: `https://ssmartree.vercel.app`
- Or your custom domain

## 🔧 Updating the Site

To update the deployment:

```bash
cd /Users/namesome/Documents/Projects/SmartTree

# Make your changes, then:
git add .
git commit -m "Update: describe your changes"
git push origin main

# Vercel will automatically redeploy
```

## 🌐 Features Deployed

- ✅ English version of the website
- ✅ Interactive phone mockup (mouse position only)
- ✅ Real plant images from Unsplash/Pexels
- ✅ Download Android APK (20MB)
- ✅ Try Web Version (Flutter web app)
- ✅ Responsive design for all devices

## 📱 Test URLs After Deployment

- Main site: `https://your-domain.vercel.app`
- Web app: `https://your-domain.vercel.app/app/`
- APK download: `https://your-domain.vercel.app/downloads/smartTree.apk`

---

**Repository**: https://github.com/Namesome404/ssmartree
**Deployment Platform**: Vercel
**Last Updated**: 2024

