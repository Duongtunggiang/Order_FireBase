# 👑 Tạo Tài Khoản Admin

## 🔥 Tạo User Admin trong Firebase Console

### Bước 1: Mở Firebase Console
- Vào: https://console.firebase.google.com/
- Chọn project **"Order"**

### Bước 2: Vào Authentication
1. Click **"Authentication"** trong menu bên trái
2. Tab **"Users"**
3. Click **"Add user"**

### Bước 3: Tạo tài khoản admin
```
Email: binhbiinshop@admin.com
Password: Duong3112
Email verified: ✅ Check
```

### Bước 4: Xác nhận
- Click **"Add user"**
- User sẽ được tạo với password đã được Firebase tự động hash

### ✅ Hoàn thành!
- Tài khoản admin đã sẵn sàng
- Trong app, chỉ user với email `binhbiinshop@admin.com` mới có quyền admin

## 🔐 Bảo mật
- Firebase tự động hash password bằng bcrypt
- Không thể xem password gốc trong Console
- User có thể đổi password trong app

## 📱 Đăng nhập
- Email: `binhbiinshop@admin.com`
- Password: `Duong3112`

## 🛠️ Troubleshooting
- Nếu login lỗi "user not found": Kiểm tra lại email chính xác
- Nếu lỗi "wrong password": Đảm bảo password đúng
- Nếu không vào được admin: Kiểm tra email phải là `binhbiinshop@admin.com` chính xác
