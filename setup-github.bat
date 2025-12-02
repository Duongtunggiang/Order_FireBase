@echo off
echo 🚀 Setup GitHub Repository cho Quan Tra Do SPA
echo.

echo 📝 Buoc 1: Tao repository tren GitHub
echo 1. Vao https://github.com/new
echo 2. Ten: quan-tra-do-spa
echo 3. Mo ta: "Quán Trà Đồ - Single Page Application"
echo 4. Chon Public
echo 5. KHONG check README, .gitignore, license
echo 6. Click "Create repository"
echo.
echo 📋 Copy URL repository va paste o buoc sau...
echo.

set /p repo_url="Nhap URL GitHub repository: "

echo.
echo 🔗 Dang ket noi voi GitHub...
git remote add origin %repo_url%

echo 📤 Dang push len GitHub...
git branch -M main
git push -u origin main

echo.
echo ✅ Hoan thanh! Repository da duoc push len GitHub
echo.
echo 🌐 Bay gio ban co the deploy len Netlify:
echo 1. Vao https://netlify.com
echo 2. Add new site > Import existing project
echo 3. Connect to Git > GitHub
echo 4. Chon repository quan-tra-do-spa
echo 5. Build command: echo "No build required"
echo 6. Publish directory: ./
echo 7. Deploy site
echo.
echo 🎉 Chuc mung! Ban se co website FREE tren Netlify!

pause
