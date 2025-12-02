# 🚨 **QUAN TRỌNG: Enable Firebase Authentication**

Ứng dụng đang bị lỗi vì **Authentication chưa được enable** trong Firebase Console.

## 🔧 **Cách sửa lỗi (3 phút):**

### Bước 1: Mở Firebase Console
- Vào: https://console.firebase.google.com/
- Chọn project **"Order"**

### Bước 2: Enable Authentication
1. Click **"Authentication"** trong menu bên trái
2. Click **"Get started"**
3. Chọn tab **"Sign-in method"**
4. Tìm **"Email/Password"** → Click **"Enable"**
5. Tìm **"Anonymous"** → Click **"Enable"**

### Bước 3: Cập nhật Authorized Domains
1. Trong Authentication > Settings
2. Tab **"Authorized domains"**
3. Click **"Add domain"**
4. Thêm: `localhost` (cho development)
5. Nếu đã deploy Netlify: thêm domain của bạn

### Bước 4: Test lại
- Refresh `index.html`
- Kiểm tra Console: không còn lỗi `auth/configuration-not-found`

## ✅ **Kết quả:**
- ✅ Không còn lỗi Firebase Auth
- ✅ Ứng dụng load data bình thường
- ✅ Menu hiển thị từ Firestore

## 🆘 **Nếu vẫn lỗi:**
- Check Firestore Rules (cho phép read/write)
- Đảm bảo đã enable Anonymous sign-in
- Refresh browser và clear cache

**Thời gian: 2-3 phút! 🚀**
