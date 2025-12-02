# 📋 Hướng Dẫn Hệ Thống Quản Lý Đơn Hàng

## 🎯 Tổng Quan

Hệ thống đơn hàng hoạt động **realtime** với Firebase Firestore, cho phép:
- Khách hàng đặt hàng và theo dõi trạng thái
- Admin nhận đơn tự động và quản lý đơn hàng
- Tự động lưu thống kê doanh thu khi hoàn thành

---

## 👥 Luồng Hoạt Động

### 📱 Phía Khách Hàng

1. **Chọn món và Order**
   - Thêm món vào giỏ hàng
   - Click nút **"Order"** 
   - Nhận mã đơn hàng (ví dụ: `#ABC123`)
   - Giỏ hàng tự động xóa

2. **Theo dõi đơn hàng**
   - Click **"Đơn Hàng Của Tôi"** ở header
   - Xem trạng thái realtime:
     - 📋 **Chờ nhận đơn** - Admin chưa xử lý
     - 👨‍🍳 **Đang làm** - Admin đang chuẩn bị
     - ✅ **Hoàn thành** - Đơn đã xong
     - ❌ **Đã hủy** - Admin hủy đơn

3. **Thông báo cập nhật**
   - Nếu Admin chỉnh sửa đơn (thêm/xóa món), sẽ có thông báo màu vàng
   - Tổng tiền tự động cập nhật theo món mới

### 🔧 Phía Admin

1. **Nhận đơn tự động**
   - Khi khách Order → đơn xuất hiện ngay trong **"📋 Quản Lý Đơn Hàng"**
   - Có thông báo âm thanh: *"Có đơn hàng mới"*
   - Popup hiển thị: `🔔 Đơn hàng mới: #ABC123`

2. **Xử lý đơn hàng**

   **Bước 1: Nhận đơn**
   - Click **"✅ Nhận đơn"**
   - Trạng thái chuyển thành: **👨‍🍳 Đang làm**
   - Hoặc click **"❌ Hủy"** nếu không thể làm

   **Bước 2: Chỉnh sửa (tùy chọn)**
   - Thêm món: Chọn món từ dropdown → Click **+**
   - Xóa món: Click **X** bên cạnh món muốn xóa
   - Tổng tiền tự động cập nhật
   - Firestore tự động sync

   **Bước 3: Hoàn thành**
   - Click **"✅ Hoàn thành"**
   - Xác nhận popup
   - Hệ thống tự động:
     - Đổi trạng thái thành **✅ Hoàn thành**
     - Lưu vào `statistics` collection (theo tháng)
     - Cộng doanh thu vào thống kê

3. **Hủy đơn**
   - Click **"❌ Hủy"** ở bất kỳ trạng thái nào (ordered hoặc preparing)
   - Xác nhận popup
   - Đơn chuyển thành **❌ Đã hủy**
   - Không tính vào doanh thu

---

## 🗄️ Cấu Trúc Dữ Liệu Firebase

### Collection: `orders`

```javascript
{
  id: "auto-generated",
  items: [
    {
      id: "item-id",
      name: "Trà Sữa Trân Châu",
      price: 25000,
      quantity: 2,
      size: "M",
      category: "Đồ Uống"
    }
  ],
  total: 50000,
  status: "ordered", // ordered → preparing → completed / cancelled
  customerId: "user-uid",
  customerEmail: "customer@example.com",
  createdAt: Timestamp,
  updatedAt: Timestamp,
  
  // Optional fields
  acceptedAt: Timestamp,      // Khi admin nhận đơn
  completedAt: Timestamp,     // Khi hoàn thành
  cancelledAt: Timestamp,     // Khi bị hủy
  cancelledBy: "admin",       // Người hủy
  updatedBy: "admin"          // Nếu admin chỉnh sửa
}
```

### Collection: `statistics`

```javascript
{
  id: "2025-01",              // Format: YYYY-MM
  year: 2025,
  month: 1,
  totalRevenue: 1250000,      // Tổng doanh thu tháng
  orderCount: 50,             // Số đơn hoàn thành
  createdAt: Timestamp,
  updatedAt: Timestamp
}
```

---

## 🔄 Trạng Thái Đơn Hàng

| Trạng thái | Icon | Mô tả | Hành động của Admin |
|-----------|------|-------|---------------------|
| `ordered` | 📋 | Đơn mới, chờ xử lý | Nhận đơn / Hủy |
| `preparing` | 👨‍🍳 | Admin đang làm | Chỉnh sửa / Hoàn thành / Hủy |
| `completed` | ✅ | Đã hoàn thành | Không thể thay đổi |
| `cancelled` | ❌ | Đã bị hủy | Không thể thay đổi |

---

## 🎨 Màu Sắc Trực Quan

### Trong Admin Dashboard:
- 🟦 **Border xanh** (ordered): Đơn mới cần xử lý
- 🟨 **Border vàng** (preparing): Đang làm
- 🟩 **Border xanh lá** (completed): Hoàn thành
- 🟥 **Border đỏ** (cancelled): Đã hủy

### Trong Đơn Hàng Của Khách:
- 🔵 **Text xanh**: Chờ nhận đơn
- 🟡 **Text vàng**: Đang làm
- 🟢 **Text xanh lá**: Hoàn thành
- 🔴 **Text đỏ**: Đã hủy

---

## 📊 Thống Kê Doanh Thu

### Cách hoạt động:
1. Khi admin click **"✅ Hoàn thành"**
2. Hệ thống tự động:
   - Lấy tháng/năm hiện tại
   - Tìm document `statistics/{YYYY-MM}`
   - Nếu **chưa có**: Tạo mới với doanh thu = giá trị đơn
   - Nếu **đã có**: Cộng dồn vào `totalRevenue` và `orderCount`

### Ví dụ:
```javascript
// Đơn #1: 50,000đ hoàn thành ngày 15/01/2025
statistics/2025-01: {
  totalRevenue: 50000,
  orderCount: 1
}

// Đơn #2: 75,000đ hoàn thành ngày 20/01/2025
statistics/2025-01: {
  totalRevenue: 125000,  // 50k + 75k
  orderCount: 2
}
```

---

## 🔔 Tính Năng Realtime

### Admin nhận đơn tự động:
- Sử dụng `onSnapshot` listener
- Khi có đơn mới → popup thông báo
- Không cần refresh trang
- Âm thanh: "Có đơn hàng mới"

### Khách hàng theo dõi trạng thái:
- Khi mở "Đơn Hàng Của Tôi" → load realtime từ Firestore
- Nếu admin cập nhật → khách thấy ngay khi mở lại

---

## 🚨 Xử Lý Edge Cases

### 1. Xóa hết món trong đơn
- Hệ thống tự động HỦY đơn
- Thông báo: *"Đơn hàng đã bị hủy (không còn món)"*

### 2. Khách chưa đăng nhập
- Vẫn có thể Order (dùng anonymous ID)
- Email hiển thị: `anonymous`

### 3. Admin offline
- Đơn vẫn được lưu vào Firestore
- Khi admin online lại → tự động load đơn

### 4. Lỗi khi lưu thống kê
- Đơn vẫn được đánh dấu **Hoàn thành**
- Console log lỗi statistics
- Không ảnh hưởng đến đơn hàng

---

## 🛠️ Testing

### Test flow đầy đủ:

1. **Đăng xuất (hoặc dùng incognito)**
   - Thêm 2-3 món vào giỏ
   - Click **"Order"**
   - Nhận mã đơn: `#ABC123`

2. **Đăng nhập Admin**
   - Vào **Dashboard** → **📋 Quản Lý Đơn Hàng**
   - Thấy đơn #ABC123 với trạng thái **📋 Chờ nhận**
   - Click **"✅ Nhận đơn"**

3. **Chỉnh sửa đơn**
   - Thêm 1 món từ dropdown
   - Xóa 1 món bằng nút **X**
   - Kiểm tra tổng tiền tự động cập nhật

4. **Hoàn thành**
   - Click **"✅ Hoàn thành"**
   - Xác nhận popup
   - Kiểm tra Firestore:
     - `orders/{id}`: `status = "completed"`
     - `statistics/2025-01`: có doanh thu cộng dồn

5. **Kiểm tra phía khách**
   - Đăng xuất Admin
   - Vào **"Đơn Hàng Của Tôi"**
   - Thấy đơn #ABC123: **✅ Hoàn thành**
   - Có thông báo vàng: *"Admin đã chỉnh sửa đơn hàng"*

---

## 🎯 Best Practices

### Cho Admin:
- ✅ Luôn **Nhận đơn** trước khi chỉnh sửa
- ✅ Kiểm tra kỹ món trước khi **Hoàn thành**
- ✅ Hủy đơn có lý do (gọi điện/nhắn tin khách)

### Cho Dev:
- ✅ Firebase Rules: Chỉ admin mới được sửa `orders`
- ✅ Index Firestore: `orders` collection → index `customerId`
- ✅ Backup: Export `statistics` hàng tháng

---

## 🔒 Firebase Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Orders: Khách tạo, Admin quản lý
    match /orders/{orderId} {
      allow create: if request.auth != null;
      allow read: if request.auth != null;
      allow update, delete: if request.auth.token.email in [
        'binhbiinshop@admin.com',
        'duong3112@gmail.com'
      ];
    }
    
    // Statistics: Chỉ Admin
    match /statistics/{statId} {
      allow read: if request.auth != null;
      allow write: if request.auth.token.email in [
        'binhbiinshop@admin.com',
        'duong3112@gmail.com'
      ];
    }
  }
}
```

---

## 📞 Hỗ Trợ

Nếu có lỗi, kiểm tra:
1. Firebase Console → Firestore → Collections `orders` và `statistics`
2. Browser Console (F12) → xem log lỗi
3. Đảm bảo admin đã đăng nhập đúng email

---

**✨ Hệ thống đã sẵn sàng! Chúc bạn kinh doanh thành công!**

