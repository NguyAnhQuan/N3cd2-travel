# N3cd2-Travel - Hệ Thống Đặt Tour Du Lịch

## 📋 Mô Tả Dự Án

Đây là dự án bài tập lớn môn **Chuyên Đề 2** do giảng viên **Đặng Khánh Trụng** hướng dẫn. Dự án nhóm 3 phát triển một **Hệ thống phần mềm đặt tour du lịch theo lịch trình có sẵn**.

Khác với các hệ thống đặt dịch vụ riêng lẻ (vé máy bay, khách sạn, xe,...), hệ thống này tập trung vào việc cung cấp các tour trọn gói đã được thiết kế sẵn, giúp người dùng dễ dàng lựa chọn và đặt tour nhanh chóng.

## 👥 Thành Viên Nhóm
| STT | Họ và Tên | MSSV | Vị Trí |
|-----|-----------|------|--------|
| 1 | Nguyễn Anh Quân | 20220839 | Trưởng Nhóm |
| 2 | Nguyễn Văn Vũ | 20220844 | Thành Viên |
| 3 | Nguyễn Sỹ Quang | 20220744 | Thành Viên |
| 4 | Nguyễn Thị An Bình | 20220997 | Thành Viên |
| 5 | Hoàng Minh Duy | 20220794 | Thành Viên |

## 🎯 Mục Tiêu Dự Án
- Xây dựng hệ thống đặt tour du lịch hiện đại, dễ sử dụng
- Cung cấp các tour du lịch có lịch trình rõ ràng, chi tiết
- Giúp người dùng đặt tour nhanh chóng mà không cần tự lên kế hoạch
- Hỗ trợ quản lý tour, đơn đặt tour và người dùng cho quản trị viên

## ✨ Tính Năng Chính
- 🔐 Đăng ký, đăng nhập và quản lý tài khoản người dùng
- 🧳 Xem danh sách các tour du lịch có sẵn
- 📅 Xem chi tiết lịch trình từng tour (ngày 1, ngày 2,...)
- 🛒 Đặt tour và quản lý đơn đặt tour
- 💳 Thanh toán (giả lập hoặc tích hợp sau)
- ⭐ Đánh giá và nhận xét tour
- 📊 Quản lý tour, đơn hàng và người dùng (Admin)
- 📱 Giao diện thân thiện trên thiết bị di động

## 🛠️ Công Nghệ Sử Dụng
- **Frontend (Mobile App):** Flutter
- **Backend (API):** Laravel (PHP)
- **Database:** MySQL / PostgreSQL
- **Authentication:** Laravel Sanctum / JWT
- **API:** RESTful API
- **Deployment:** VPS / Docker
- **Version Control:** Git

## 📦 Cài Đặt và Chạy Dự Án

### Yêu Cầu
- PHP >= 8.x
- Composer
- Flutter SDK
- MySQL hoặc PostgreSQL
- Node.js (phục vụ build assets nếu cần)

### 🔧 Backend (Laravel)

1. Clone repository:
```bash
git clone https://github.com/NguyAnhQuan/N3cd2-travel.git
cd N3cd2-travel/backend
```

2. Cài đặt dependencies:
```bash
composer install
```

3. Tạo file .env:
```bash
cp .env.example .env
```

4. Cấu hình database trong .env:
```
DB_DATABASE=travel
DB_USERNAME=root
DB_PASSWORD=123456
```

5. Generate key:
```bash
php artisan key:generate
```

6. Migrate database:
```bash
php artisan migrate
```

7. Chạy server:
```bash
php artisan serve
```

### 📱 Frontend (Flutter)

1. Di chuyển vào thư mục frontend:
```bash
cd ../frontend
```

2. Cài đặt dependencies:
```bash
flutter pub get
```

3. Chạy ứng dụng:
```bash
flutter run
```

## 📁 Cấu Trúc Dự Án
```
N3cd2-travel/
├── backend/                # Laravel API
│   ├── app/
│   ├── routes/
│   ├── database/
│   └── ...
├── frontend/               # Flutter App
│   ├── lib/
│   ├── assets/
│   └── pubspec.yaml
├── docs/
├── README.md
```

## 📚 Tài Liệu
- [Tài liệu kỹ thuật](./docs/TECHNICAL.md)
- [API Documentation](./docs/API.md)

## 🤝 Đóng Góp

Các thành viên trong nhóm có thể đóng góp bằng cách:

1. Tạo branch mới (feature/ten-chuc-nang)
2. Commit code
3. Push lên repository
4. Tạo Pull Request

## 📝 License

Dự án được phát triển phục vụ mục đích học tập.

## 📞 Liên Hệ

Mọi thắc mắc xin liên hệ trưởng nhóm: **Nguyễn Anh Quân**