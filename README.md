# Quán Trà Đồ - Single Page Application

Một ứng dụng web đơn trang cho quán trà sữa và đồ ăn, được xây dựng bằng HTML, JavaScript, Tailwind CSS và Firebase.

## Tính năng

### 🏪 Giao diện Khách hàng
- **Header**: Logo quán, liên hệ, đăng nhập, giỏ hàng
- **Menu chọn danh mục**: Đồ Uống, Đồ Ăn, Đồ Nhậu
- **Layout đồ uống**: 1 món/hàng, ảnh bên trái, thông tin bên phải
- **Layout đồ ăn/đồ nhậu**: 2 món/hàng, khung vuông với ảnh trên
- **Giỏ hàng**: Slide-in từ phải, có thể thêm/bớt số lượng
- **Thanh toán**: Mock payment với thông báo thành công

### 🔐 Hệ thống Đăng nhập Admin
- Đăng nhập bằng email/password
- Chế độ xem kép: Khách hàng ↔ Admin
- Bảo mật với Firebase Authentication

### 👨‍💼 Bảng điều khiển Admin
- **Thống kê**: Doanh thu tháng, số đơn hàng, số món đang bán
- **Quản lý menu**: Thêm, sửa, xóa món ăn/đồ uống
- **Form quản lý**: Tên, giá, danh mục, ảnh, mô tả
- **Danh sách món**: Bảng hiển thị tất cả món với thao tác sửa/xóa

## Công nghệ sử dụng

- **Frontend**: HTML5, JavaScript ES6+, Tailwind CSS
- **Icons**: Lucide Icons
- **Database**: Firebase Firestore
- **Authentication**: Firebase Auth
- **Text-to-Speech**: Google Gemini AI API
- **Responsive**: Mobile-first design

## Cài đặt và chạy

1. **Clone/download** files: `index.html`, `data.json`

2. **Cấu hình Firebase** (tùy chọn):
   - Tạo project Firebase
   - Cập nhật config trong code `index.html`
   - Thiết lập Firestore rules và Auth

3. **Import dữ liệu mẫu** (tùy chọn):
   ```bash
   # Cách 1: Manual import vào Firebase Console
   # - Copy nội dung file data.json
   # - Vào Firebase Console > Firestore > Import JSON
   # - Paste và import vào collection 'menuItems'

   # Cách 2: Sử dụng script tự động
   npm install
   # Cập nhật firebase config trong import-data.js
   npm run import
   ```

4. **Chạy ứng dụng**:
   ```bash
   # Sử dụng Python server
   python -m http.server 8000

   # Hoặc mở trực tiếp file HTML trong browser
   ```

5. **Truy cập**: `http://localhost:8000` hoặc mở file HTML

## 🔥 Firebase Setup

### Quan trọng: Ứng dụng sử dụng **Firestore Database**, không phải Realtime Database!

**Nếu bạn đã import vào Realtime Database, hãy làm theo bước sau:**

### 1. Chuyển sang Firestore Database:
- Trong Firebase Console, click **"Firestore Database"** (không phải Realtime Database)
- Click **"Create database"**
- Chọn **"Start in test mode"** (cho development)
- Chọn location: **asia-southeast1** (Singapore)

### 2. Import dữ liệu mẫu:

#### 🚀 Cách nhanh (nếu không có lỗi):
- Mở file `import-firebase.html` trong browser
- Copy Firebase config từ Console (Project Settings > General > Your apps)
- Paste vào tool và click "🚀 Bắt Đầu Import"

#### 🔧 Debug từng bước (nếu gặp lỗi):
1. Mở `simple-import.html` → Test connection
2. Nếu OK → Add sample item
3. Nếu OK → Dùng `import-firebase.html` đầy đủ
4. Xem `FIRESTORE-IMPORT-GUIDE.md` để fix lỗi thường gặp

### Hoặc import thủ công (nếu không dùng tool):
- Trong Firestore Console, click **"+ Start collection"**
- Collection ID: `menuItems`
- Click **"+ Add document"** (không cần Document ID)
- Copy từng object từ `data.json` và paste vào fields
- Lặp lại cho tất cả 18 món

### 3. Hoặc dùng script tự động:
```bash
npm install
# Cập nhật firebase config trong import-data.js
npm run import
```

## 🚀 Deployment

### ✅ Đã Deploy lên GitHub + Netlify (Free)

**GitHub Repository**: https://github.com/Duongtunggiang/Order_FireBase

1. **Code đã được push lên GitHub thành công** ✨

2. **Deploy lên Netlify** (3 phút):
   - Vào [Netlify](https://netlify.com)
   - "Add new site" > "Import an existing project"
   - Connect to GitHub > Tìm và chọn repo `Duongtunggiang/Order_FireBase`
   - **Build settings**:
     - Build command: `echo "No build required"`
     - Publish directory: `./` (root folder)
   - Click "Deploy site"

3. **Cập nhật Firebase Config** (tùy chọn):
   - Sau khi deploy, cập nhật domain Netlify vào Firebase Console
   - Authorized domains trong Authentication settings

### 🌟 Live Demo
Sau khi deploy thành công, bạn sẽ có URL miễn phí từ Netlify!
**Ví dụ**: `https://your-app-name.netlify.app`

### 📁 Files được deploy:
- ✅ `index.html` - Ứng dụng chính
- ✅ `README.md` - Tài liệu
- ✅ `_redirects` - Netlify redirects
- ✅ `netlify.toml` - Netlify config
- ❌ `data.json` - Chỉ dùng để import Firebase (không deploy)
- ❌ `import-data.js` - Chỉ dùng development (không deploy)
- ❌ `package.json` - Chỉ dùng development (không deploy)

## Cấu trúc file

```
index.html          # Toàn bộ ứng dụng SPA
├── Header          # Logo, menu, đăng nhập
├── Menu Selection  # Chọn danh mục
├── Menu Display    # Hiển thị món theo layout
├── Cart Sidebar    # Giỏ hàng slide-in
├── Login Form      # Đăng nhập admin
├── Admin Dashboard # Quản lý quán
└── Footer          # Thông tin bản quyền
```

## Tính năng đặc biệt

- **Responsive Design**: Hoạt động tốt trên mọi thiết bị
- **Real-time Sync**: Menu tự động cập nhật từ Firebase
- **Persistent Cart**: Giỏ hàng lưu trong localStorage
- **Voice Feedback**: TTS thông báo khi thanh toán
- **Smooth Animations**: Transitions mượt mà
- **Theme Colors**: Màu cam vàng nâu ấm áp

## Demo Data

Ứng dụng bao gồm dữ liệu mẫu để demo. Để sử dụng với dữ liệu thật:

1. Đăng nhập admin (tạo tài khoản Firebase Auth)
2. Thêm món mới qua giao diện admin
3. Dữ liệu sẽ được lưu vào Firestore

## Browser Support

- Chrome 80+
- Firefox 75+
- Safari 13+
- Edge 80+

## License

Dự án này được tạo cho mục đích demo và học tập.
