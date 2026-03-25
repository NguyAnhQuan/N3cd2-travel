# N3cd2-Travel - Hệ Thống Quản Lý Du Lịch

## 📋 Mô Tả Dự Án
Đây là dự án bài tập lớn môn **Chuyên Đề 2** do giảng viên **Đặng Khánh Trụng** dạy. Dự án nhóm 3 phát triển một **Hệ thống phần mềm quản lý du lịch** toàn diện giúp người dùng quản lý các chuyến du lịch, đặt vé, khách sạn và tạo lịch trình du lịch.

## 👥 Thành Viên Nhóm
| STT | Họ và Tên | MSSV | Vị Trí |
|-----|-----------|------|--------|
| 1 | Nguyễn Anh Quân | 20220839 | Trưởng Nhóm |
| 2 | Nguyễn Văn Vũ | 20220844 | Thành Viên |
| 3 | Nguyễn Sỹ Quang | 20220744 | Thành Viên |
| 4 | Nguyễn Thị An Bình | 20220997 | Thành Viên |
| 5 | Hoàng Minh Duy | 20220794 | Thành Viên |

## 🎯 Mục Tiêu Dự Án
- Xây dựng ứng dụng quản lý du lịch hiện đại và thân thiện với người dùng
- Cung cấp các tính năng tìm kiếm, đặt vé máy bay, khách sạn
- Quản lý lịch trình và ngân sách du lịch
- Hỗ trợ người dùng trong việc lên kế hoạch các chuyến du lịch

## ✨ Tính Năng Chính
- 🔐 Xác thực và quản lý tài khoản người dùng
- ✈️ Tìm kiếm và đặt vé máy bay
- 🏨 Tìm kiếm và đặt khách sạn
- 🚗 Dịch vụ cho thuê xe hơi
- 📅 Tạo và quản lý lịch trình du lịch
- 💰 Quản lý ngân sách và chi phí
- 🗺️ Hướng dẫn du lịch và mẹo hữu ích
- 📱 Giao diện thân thiện với thiết bị di động

## 🛠️ Công Nghệ Sử Dụng
- **Frontend:** React.js, Redux, Axios
- **Backend:** Node.js, Express.js
- **Database:** MongoDB
- **Authentication:** JWT
- **Deployment:** Heroku / AWS
- **Version Control:** Git

## 📦 Cài Đặt và Chạy Dự Án

### Yêu Cầu
- Node.js (v14 trở lên)
- MongoDB
- npm hoặc yarn

### Hướng Dẫn Cài Đặt
1. Clone repository:
   ```bash
   git clone https://github.com/NguyAnhQuan/N3cd2-travel.git
   cd N3cd2-travel
   ```

2. Cài đặt dependencies:
   ```bash
   npm install
   ```

3. Cấu hình biến môi trường (tạo file `.env`):
   ```
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/travel
   JWT_SECRET=your_secret_key
   ```

4. Chạy ứng dụng:
   ```bash
   npm start
   ```

5. Truy cập ứng dụng tại: `http://localhost:3000`

## 📁 Cấu Trúc Dự Án
```
N3cd2-travel/
├── client/                 # Frontend React
│   ├── src/
│   ├── public/
│   └── package.json
├── server/                 # Backend Node.js
│   ├── routes/
│   ├── models/
│   ├── controllers/
│   └── server.js
├── .gitignore
├── README.md
└── package.json
```

## 📚 Tài Liệu
- [Tài liệu kỹ thuật](./docs/TECHNICAL.md)
- [Hướng dẫn cho nhà phát triển](./docs/DEVELOPER.md)
- [API Documentation](./docs/API.md)

## 🤝 Đóng Góp
Mọi thành viên trong nhóm đều có thể đóng góp cho dự án. Vui lòng:
1. Fork repository
2. Tạo branch cho feature mới (`git checkout -b feature/AmazingFeature`)
3. Commit thay đổi (`git commit -m 'Add some AmazingFeature'`)
4. Push lên branch (`git push origin feature/AmazingFeature`)
5. Tạo Pull Request

## 📝 License
Dự án này được phát triển cho mục đích học tập.

## 📞 Liên Hệ
Nếu có bất kỳ câu hỏi hoặc góp ý, vui lòng liên hệ trưởng nhóm: Nguyễn Anh Quân
