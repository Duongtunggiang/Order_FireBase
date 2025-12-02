# 📋 Hướng Dẫn Import Data vào Firestore

## 🔥 Tại Sao Không Có Nút Import?

**Firestore không có nút "Import JSON" như Realtime Database.** Thay vào đó, bạn có 2 cách:

## ⚠️ Lỗi Thường Gặp & Cách Sửa

### Lỗi: "Firebase: Error (auth/configuration-not-found)"
**Nguyên nhân:** Authentication chưa được enable
**Cách sửa:**
1. Vào Firebase Console > Authentication
2. Click **"Get started"**
3. Chọn **"Email/Password"** và **"Anonymous"**
4. Click **"Enable"** cho cả hai provider
5. Trong **Settings** > **Authorized domains**: thêm `localhost` và domain Netlify

### Lỗi: "Missing or insufficient permissions"
**Nguyên nhân:** Firestore Rules chưa được setup đúng
**Cách sửa:**
1. Vào Firebase Console > Firestore Database > Rules
2. Thay đổi rules thành:
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```
3. Click "Publish"

### Lỗi: "Firestore hasn't been initialized"
**Nguyên nhân:** Firestore chưa được enable trong project
**Cách sửa:**
1. Vào Firebase Console > Firestore Database
2. Click "Create database"
3. Chọn location: `asia-southeast1` (Singapore)
4. Chọn "Start in test mode"
5. Click "Done"

### Lỗi: "Invalid Firebase config"
**Nguyên nhân:** Config bị thiếu field
**Cách sửa:** Đảm bảo config đầy đủ:
```javascript
const firebaseConfig = {
  apiKey: "AIzaSy...",
  authDomain: "order-d8a0c.firebaseapp.com",
  projectId: "order-d8a0c",
  storageBucket: "order-d8a0c.firebasestorage.app",
  messagingSenderId: "559568129038",
  appId: "1:559568129038:web:dd1ebcefb23f7cf03dc05f"
};
```

### 🛠️ Cách 1: Debug từng bước (Khuyến nghị khi gặp lỗi)

1. **Mở file `simple-import.html`** trong browser
2. **Click "Test Firebase Connection"** - kiểm tra kết nối
3. **Click "Add Sample Item"** - thử thêm 1 item mẫu
4. **Nếu thành công** → dùng `import-firebase.html` để import đầy đủ

### 🛠️ Cách 2: Dùng Tool đầy đủ

1. **Mở file `import-firebase.html`** trong browser
2. **Copy Firebase config từ Project Settings**
3. **Paste vào tool** và click "🚀 Bắt Đầu Import"

### 📝 Cách 2: Thêm Thủ Công (Manual)

#### Bước 1: Tạo Collection
1. Trong Firestore Console, click **"+ Start collection"**
2. **Collection ID:** `menuItems`
3. Click **Next**

#### Bước 2: Thêm Document Đầu Tiên
1. **Document ID:** để trống (Firestore sẽ tự tạo)
2. Thêm các field theo format:

```
name: "Trà Sữa Trân Châu Đường Đen" (string)
description: "Trà sữa truyền thống với trân châu dẻo ngon..." (string)
price: 35000 (number)
category: "Đồ Uống" (string)
imageUrl: "https://images.unsplash.com/photo-..." (string)
updatedAt: (timestamp) - chọn "Now"
```

3. Click **Save**

#### Bước 3: Lặp Lại Cho Các Món Còn Lại
- Click **"+ Add document"** để thêm món tiếp theo
- Copy data từ `data.json` và paste vào fields
- Lặp lại cho tất cả 18 món

## 📋 Dữ Liệu Mẫu (Copy & Paste)

### Đồ Uống:
```json
{
  "name": "Trà Sữa Trân Châu Đường Đen",
  "description": "Trà sữa truyền thống với trân châu dẻo ngon và đường đen đặc trưng",
  "price": 35000,
  "category": "Đồ Uống",
  "imageUrl": "https://images.unsplash.com/photo-1558857563-b371033873b8?w=400&h=300&fit=crop&crop=center",
  "updatedAt": "<Thời gian hiện tại>"
}
```

### Đồ Ăn:
```json
{
  "name": "Phở Bò",
  "description": "Phở bò tái chín với nước dùng ninh xương thơm ngọt",
  "price": 40000,
  "category": "Đồ Ăn",
  "imageUrl": "https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=400&h=300&fit=crop&crop=center",
  "updatedAt": "<Thời gian hiện tại>"
}
```

### Đồ Nhậu:
```json
{
  "name": "Bia Sài Gòn Lager",
  "description": "Bia Sài Gòn Lager mát lạnh, vị đắng nhẹ",
  "price": 25000,
  "category": "Đồ Nhậu",
  "imageUrl": "https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&h=300&fit=crop&crop=center",
  "updatedAt": "<Thời gian hiện tại>"
}
```

## ✅ Kiểm Tra Sau Khi Import

1. Vào Firestore Console
2. Xem collection `menuItems`
3. Nên có 18 documents
4. Test ứng dụng: dữ liệu sẽ hiện trên website

## 🆘 Troubleshooting

### Lỗi "Permission Denied"
- Kiểm tra Firestore Rules
- Thêm rule: `allow read, write: if true;` (cho development)

### Lỗi "Invalid Data"
- Kiểm tra format field (string/number)
- `price` phải là number, không phải string

### Không thấy dữ liệu trên app
- Kiểm tra Firebase config trong `index.html`
- Refresh browser
- Kiểm tra Console browser (F12) xem có lỗi gì

## 🎯 Kết Luận

**Khuyến nghị dùng Tool tự động** (`import-firebase.html`) - nhanh và ít lỗi hơn!

Nếu vẫn muốn làm thủ công, hãy thêm từng món một cách cẩn thận. 🚀
