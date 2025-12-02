# 🚀 Checklist Deploy Quán Trà Đồ SPA

## ✅ Đã chuẩn bị:
- [x] File `index.html` - Ứng dụng SPA hoàn chỉnh
- [x] File `data.json` - Dữ liệu mẫu để import Firebase
- [x] File `README.md` - Hướng dẫn đầy đủ
- [x] File `_redirects` - Netlify redirects
- [x] File `netlify.toml` - Cấu hình Netlify
- [x] File `.gitignore` - Loại bỏ files không cần thiết
- [x] Git repository đã khởi tạo và commit

## 🔄 Các bước deploy:

### 1. Tạo GitHub Repository
- [ ] Vào https://github.com/new
- [ ] Tên: `quan-tra-do-spa`
- [ ] Mô tả: "Quán Trà Đồ - Single Page Application"
- [ ] Chọn **Public**
- [ ] **KHÔNG** check README, .gitignore, license
- [ ] Click "Create repository"
- [ ] Copy URL repository

### 2. Push lên GitHub
```bash
# Chạy script tự động (Windows)
setup-github.bat

# Hoặc chạy manual
git remote add origin <URL_repository>
git branch -M main
git push -u origin main
```

### 3. Deploy lên Netlify
- [ ] Vào https://netlify.com
- [ ] "Add new site" > "Import an existing project"
- [ ] "Connect to Git provider" > GitHub
- [ ] Chọn repository `quan-tra-do-spa`
- [ ] **Build settings**:
  - Build command: `echo "No build required"`
  - Publish directory: `./` (thư mục gốc)
- [ ] Click "Deploy site"
- [ ] Chờ deploy hoàn thành (~1-2 phút)

### 4. Cập nhật Firebase (Tùy chọn)
- [ ] Vào Firebase Console > Authentication > Settings
- [ ] Thêm domain Netlify vào "Authorized domains"
- [ ] Import dữ liệu từ `data.json` vào Firestore

## 🎉 Kết quả:
- ✅ Website FREE trên Netlify (https://xxx.netlify.app)
- ✅ GitHub repository public
- ✅ Tất cả tính năng hoạt động
- ✅ Responsive trên mọi thiết bị

## 🆘 Troubleshooting:

### Lỗi "Page not found" trên Netlify:
- Kiểm tra file `_redirects` và `netlify.toml` đã được push lên GitHub
- Rebuild site trên Netlify

### Firebase không hoạt động:
- Kiểm tra Firebase config trong `index.html`
- Thêm domain Netlify vào Authorized domains
- Import dữ liệu từ `data.json`

### GitHub push lỗi:
```bash
# Reset và push lại
git remote remove origin
git remote add origin <URL_mới>
git push -u origin main --force
```

## 📞 Hỗ trợ:
Nếu gặp vấn đề, kiểm tra:
1. Console browser (F12) xem có lỗi gì
2. Network tab xem Firebase requests
3. Netlify build logs

**Chúc bạn deploy thành công! 🎊**
