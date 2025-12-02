#!/bin/bash

# Script để deploy lên GitHub và Netlify
echo "🚀 Chuẩn bị deploy Quán Trà Đồ SPA"

# Kiểm tra Git status
echo "📋 Kiểm tra Git status..."
git status

# Push lên GitHub
echo "📤 Push lên GitHub..."
echo "Hãy tạo repository trên GitHub trước:"
echo "1. Vào https://github.com/new"
echo "2. Tên repo: quan-tra-do-spa"
echo "3. Không cần README, .gitignore, license"
echo "4. Copy URL repository và chạy:"
echo ""
echo "git remote add origin <URL_repository>"
echo "git branch -M main"
echo "git push -u origin main"
echo ""

# Hướng dẫn Netlify
echo "🌐 Deploy lên Netlify:"
echo "1. Vào https://netlify.com"
echo "2. Connect to Git > GitHub"
echo "3. Chọn repository quan-tra-do-spa"
echo "4. Build settings:"
echo "   - Build command: echo 'No build required'"
echo "   - Publish directory: ./"
echo "5. Deploy!"
echo ""

echo "✨ Hoàn thành setup!"
