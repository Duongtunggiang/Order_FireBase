# Chill Coffee - Hệ thống Quản lý Quán Cà Phê

Ứng dụng web quản lý quán cà phê và đặt hàng trực tuyến, được xây dựng bằng HTML, JavaScript, Tailwind CSS và Firebase.

## Mục đích sử dụng

Ứng dụng này được thiết kế để quản lý quán cà phê một cách hiệu quả, bao gồm:
- Quản lý menu món ăn và đồ uống
- Xử lý đơn hàng từ khách hàng
- Theo dõi thống kê doanh thu và đơn hàng
- Quản lý danh mục sản phẩm

## Tính năng

### 🏪 Giao diện Khách hàng
- **Header cố định**: Logo quán, thông tin liên hệ, đăng nhập admin, giỏ hàng
- **Menu danh mục động**: Tự động hiển thị danh mục có món, ưu tiên danh mục có nhiều món nhất
- **Hiển thị món ăn**: 
  - Layout responsive theo từng danh mục
  - Hiển thị giá cũ và giá mới (nếu có)
  - Ưu tiên hiển thị món có trạng thái đặc biệt lên trước
  - Chỉ hiển thị món đang hoạt động (không hiển thị món đã xóa)
- **Giỏ hàng**: 
  - Slide-in từ bên phải
  - Thêm/bớt số lượng món
  - Xem chi tiết món trước khi thêm vào giỏ
  - Hiển thị ảnh món trong modal chi tiết
- **Đặt hàng**: 
  - Đặt hàng với thông tin khách hàng hoặc đặt hàng nhanh (guest)
  - Xem lịch sử đơn hàng
  - Hủy đơn hàng khi đang ở trạng thái "Chờ nhận" với lý do hủy và gợi ý

### 🔐 Hệ thống Đăng nhập Admin
- Đăng nhập bằng email/password với Firebase Authentication
- Toggle hiển thị/ẩn mật khẩu khi nhập
- Chế độ xem kép: Khách hàng ↔ Admin
- Bảo mật với session management

### 👨‍💼 Bảng điều khiển Admin

#### 📊 Thống kê
- **Doanh thu tháng**: Tổng doanh thu trong tháng hiện tại
- **Đơn đã hoàn thành**: Số đơn hàng đã hoàn thành trong tháng này
- **Số món đang bán**: Tổng số món đang hoạt động

#### 🍽️ Quản lý Menu
- **Thêm món mới**: 
  - Tên món, giá cũ, giá mới (nếu có)
  - Chọn danh mục
  - Upload và cắt ảnh (tự động nén xuống dưới 1MB)
  - Mô tả món
  - Trạng thái đặc biệt (nổi bật)
  - Trạng thái hết hàng
  - **Bắt buộc**: Phải chọn ảnh món mới có thể tạo
- **Sửa món**: Cập nhật thông tin món đã có
- **Xóa món**: Xóa món vào thùng rác (soft delete)
- **Danh sách món**: 
  - Hiển thị tất cả món với ảnh, tên, giá
  - Hiển thị giá cũ màu đen bình thường (không gạch ngang)
  - Hiển thị giá mới nếu có
  - Thao tác sửa/xóa nhanh

#### 📦 Quản lý Đơn hàng
- **Lọc theo trạng thái**: 
  - Chờ nhận đơn
  - Đang chuẩn bị
  - Đang giao
  - Đã hoàn thành
  - Đã hủy
  - Layout responsive: 2 cột (mobile), 3 cột (tablet), 4 cột (desktop)
- **Chi tiết đơn hàng**: 
  - Thông tin khách hàng
  - Danh sách món đã đặt
  - Tổng tiền
  - Trạng thái đơn hàng
  - Cập nhật trạng thái đơn hàng
- **Xử lý đơn hàng**: Cập nhật trạng thái từng bước

#### 🗂️ Quản lý Danh mục
- **Thêm danh mục mới**: Tạo danh mục mới cho menu
- **Sửa danh mục**: Cập nhật tên danh mục
- **Xóa danh mục**: Xóa danh mục vào thùng rác (soft delete)
- **Tự động xử lý trùng lặp**: 
  - Nếu danh mục trùng đã bị xóa (trong thùng rác), tự động xóa vĩnh viễn và cho phép tạo mới
  - Nếu danh mục trùng đang hoạt động, hiển thị cảnh báo
- **Hiển thị**: 
  - Chỉ hiển thị danh mục đang hoạt động
  - Không hiển thị danh mục đã xóa hoặc danh mục không có món

#### 🗑️ Thùng rác
- **Quản lý items đã xóa**: 
  - Đơn hàng đã xóa
  - Món ăn đã xóa
  - Danh mục đã xóa
- **Tính năng**:
  - **Khôi phục**: Khôi phục item về trạng thái hoạt động
  - **Xóa vĩnh viễn**: Xóa hoàn toàn khỏi hệ thống
  - **Xóa tất cả**: Xóa vĩnh viễn tất cả items trong thùng rác (có xác nhận)
  - **Đếm ngược tự động xóa**: Hiển thị số ngày còn lại trước khi tự động xóa (30 ngày)
  - **Ẩn/Hiện mục**: Toggle để ẩn/hiện từng mục (Đơn hàng, Món ăn, Danh mục)
  - **Tự động ẩn**: Mục không có items sẽ tự động ẩn
- **Layout**:
  - Badge đếm ngược ở góc trên bên trái
  - Nút hành động (Khôi phục, Xóa vĩnh viễn) xếp dọc ở góc trên bên phải
  - Trên mobile (<640px): Chỉ hiển thị icon, không hiển thị text
  - Giới hạn hiển thị items trong đơn hàng: Tối đa 4 items, scroll nếu nhiều hơn
- **Thông báo**: Tất cả items trong thùng rác sẽ tự động bị xóa sau 30 ngày

## Công nghệ sử dụng

- **Frontend**: HTML5, JavaScript ES6+, Tailwind CSS
- **Icons**: Lucide Icons
- **Database**: Firebase Firestore (Real-time database)
- **Authentication**: Firebase Auth
- **Storage**: Firebase Storage (lưu trữ ảnh)
- **Responsive**: Mobile-first design với Tailwind CSS

## Cấu trúc ứng dụng

```
index.html          # Toàn bộ ứng dụng Single Page Application
├── Header          # Logo, menu, đăng nhập, giỏ hàng (fixed)
├── Menu Selection  # Chọn danh mục động
├── Menu Display    # Hiển thị món theo layout responsive
├── Cart Sidebar    # Giỏ hàng slide-in từ phải
├── Order Modal     # Chi tiết đơn hàng và hủy đơn
├── Login Form      # Đăng nhập admin với toggle password
├── Admin Dashboard # Quản lý quán
│   ├── Thống kê    # Doanh thu, đơn hàng, số món
│   ├── Quản lý Menu # CRUD món ăn với upload ảnh
│   ├── Quản lý Đơn hàng # Xem và cập nhật trạng thái
│   ├── Quản lý Danh mục # CRUD danh mục
│   └── Thùng rác   # Quản lý items đã xóa
└── Footer          # Thông tin bản quyền
```

## Tính năng đặc biệt

- **Responsive Design**: Hoạt động tốt trên mọi thiết bị (mobile, tablet, desktop)
- **Real-time Sync**: Menu và đơn hàng tự động cập nhật từ Firebase
- **Persistent Cart**: Giỏ hàng lưu trong localStorage, không mất khi refresh
- **Image Compression**: Tự động nén ảnh xuống dưới 1MB khi upload
- **Soft Delete**: Xóa mềm với khả năng khôi phục và tự động xóa sau 30 ngày
- **Dynamic Category**: Tự động hiển thị danh mục có món, ưu tiên danh mục có nhiều món nhất
- **Order Management**: Quản lý đơn hàng với nhiều trạng thái và khả năng hủy đơn
- **Smooth Animations**: Transitions mượt mà với Tailwind CSS
- **Theme Colors**: Màu cam vàng nâu ấm áp phù hợp với quán cà phê

## Cách quản lý

### Quản lý Menu
1. Đăng nhập vào tài khoản admin
2. Vào "Quản lý Menu"
3. Click "Thêm món mới" → Điền thông tin → **Bắt buộc chọn ảnh** → Lưu
4. Để sửa: Click nút "Sửa" trên món cần sửa
5. Để xóa: Click nút "Xóa" → Món sẽ vào thùng rác

### Quản lý Danh mục
1. Vào "Quản lý Menu" → Tab "Danh mục"
2. Thêm/Sửa/Xóa danh mục
3. Danh mục đã xóa sẽ vào thùng rác, có thể khôi phục hoặc xóa vĩnh viễn

### Quản lý Đơn hàng
1. Vào "Quản lý Đơn hàng"
2. Lọc theo trạng thái để xem đơn hàng
3. Click vào đơn hàng để xem chi tiết
4. Cập nhật trạng thái đơn hàng: Chờ nhận → Đang chuẩn bị → Đang giao → Đã hoàn thành

### Quản lý Thùng rác
1. Vào "Thùng rác"
2. Xem các items đã xóa (Đơn hàng, Món ăn, Danh mục)
3. **Khôi phục**: Click "♻️ Khôi phục" để đưa item về trạng thái hoạt động
4. **Xóa vĩnh viễn**: Click "⚠️ Xóa vĩnh viễn" để xóa hoàn toàn
5. **Xóa tất cả**: Click "Xóa tất cả" → Xác nhận 2 lần để xóa tất cả
6. **Ẩn/Hiện mục**: Click nút "Ẩn"/"Hiện" để thu gọn/mở rộng mục
7. Lưu ý: Tất cả items sẽ tự động bị xóa sau 30 ngày

### Xem Thống kê
1. Vào "Thống kê" trong admin dashboard
2. Xem doanh thu tháng, số đơn đã hoàn thành, số món đang bán

## License

Dự án này được tạo cho mục đích quản lý quán cà phê.
