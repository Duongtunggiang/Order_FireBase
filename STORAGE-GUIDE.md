# 📸 Hướng Dẫn Quản Lý Ảnh

## 💡 Cách Lưu Ảnh Trong Ứng Dụng

### ✅ Phương Pháp Đang Dùng: **Data URL (Base64)**

Ảnh được convert thành **Base64 Data URL** và lưu trực tiếp trong Firestore.

#### **Ưu điểm:**
- ✅ Không cần Firebase Storage
- ✅ Không lo CORS
- ✅ Deploy dễ dàng trên Netlify
- ✅ Không cần configure Storage Rules
- ✅ Ảnh luôn đi kèm với data

#### **Nhược điểm:**
- ⚠️ Giới hạn kích thước: **1MB/ảnh** (đã set trong code)
- ⚠️ Firestore document size limit: **1MB** (toàn bộ document)

### 📝 **Cách Sử Dụng:**

#### 1. **Thêm món mới với ảnh:**
- Upload file từ máy (< 1MB)
- Ảnh tự động convert thành Data URL
- Lưu vào Firestore cùng dữ liệu món

#### 2. **Hoặc dùng URL ảnh online:**
- Paste URL ảnh từ internet
- VD: `https://images.unsplash.com/...`
- Không giới hạn kích thước

### 🔧 **Resize Ảnh Trước Khi Upload:**

Để giảm kích thước ảnh, dùng tools online:
- https://tinypng.com/
- https://squoosh.app/
- https://compressor.io/

Hoặc resize bằng code (thêm vào sau):
```javascript
// Resize image before converting to Data URL
async function resizeImage(file, maxWidth = 800, maxHeight = 600) {
    // Implementation...
}
```

### 📊 **Khuyến nghị:**

#### **Cho Ảnh < 1MB:**
- ✅ Upload trực tiếp từ file
- ✅ Convert to Data URL
- ✅ Lưu trong Firestore

#### **Cho Ảnh > 1MB:**
- ✅ Dùng URL từ CDN/hosting khác
- ✅ VD: Unsplash, Imgur, Cloudinary
- ✅ Paste URL vào form

### 🚀 **Alternative: Firebase Storage (Nếu Cần)**

Nếu muốn dùng Firebase Storage cho ảnh lớn:

1. **Enable Storage:**
   - Firebase Console > Storage
   - Click "Get started"

2. **Update Rules:**
```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /menu-images/{imageId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
  }
}
```

3. **Uncomment Storage code** trong `index.html`

### 📱 **Khi Deploy lên Netlify:**

- ✅ Data URL sẽ hoạt động 100%
- ✅ Không cần setup gì thêm
- ✅ Ảnh luôn đi kèm với data

### 🎯 **Kết Luận:**

**Data URL** là phương pháp tốt nhất cho:
- ✅ Ảnh nhỏ (< 1MB)
- ✅ Deploy đơn giản
- ✅ Không lo CORS

**URL từ CDN** tốt nhất cho:
- ✅ Ảnh lớn
- ✅ Nhiều ảnh chất lượng cao
- ✅ Tiết kiệm bandwidth
