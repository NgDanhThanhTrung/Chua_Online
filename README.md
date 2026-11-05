# 🪷 Chùa Online TikTok Live - Interactive Buddhist Temple

Chùa Online TikTok Live là một ứng dụng tương tác thời gian thực cho TikTok Live, cho phép người xem tham gia các nghi lễ Phật giáo trực tiếp qua màn hình chùa ảo.

## ✨ Tính Năng

### 🎮 Tương Tác Người Xem
- **Thắp hương**: Người xem có thể thắp hương cầu nguyện
- **Bái lạy**: Tự động bái lạy 3 lần khi có sự kiện
- **Gõ mõ**: Nhịp mõ từ người xem (like)
- **Thỉnh chuông**: Follow/share → chuông vang
- **Cầu nguyện**: Bình luận/điều ước → thả đèn hoa đăng
- **Dâng cúng**: Quà tặng → dâng lễ vật (hoa sen, ngũ quả, đèn lư ly, kim long)
- **Xin xăm**: Xem quẻ linh xăm 18 quẻ

### 🎨 Giao Diện
- **Đạo Tràng 40 Phật Tử**: 4 hàng x 5 cột x 2 bên = 40 người
- **6 Đệm Quỳ VIP**: Top 6 người có công đức cao nhất
- **Phật A Di Đà**: Hình ảnh 3D với hào quang xoay
- **Hiệu ứng**: Khói hương, hoa sen, chuông vang, người đi lên dâng hương
- **Nền Tàu Màu**: Trang trí vàng, đỏ theo phong cách chùa Việt

### 🔊 Âm Thanh
- **Nhạc nền**: Nhạc thiền êm dịu
- **Giọng đọc AI**: ZeroTTS (giọng Mai Chi) đọc các nghi lễ, cầu nguyện
- **Hiệu ứng âm**: Tiếng chuông, tiếng mõ, tiếng nén hương

### 📊 Theo Dõi
- **Bảng vàng công đức**: Leaderboard top người xem
- **Lịch sử sự kiện**: Ghi lại thắp hương, bái lạy, dâng cúng
- **Đếm người xem**: Số lượng người xem thực-time

## 🚀 Cài Đặt

### Yêu Cầu Hệ Thống
- **Node.js**: v18 trở lên
- **Python**: 3.10 trở lên
- **uv**: Package manager Python
- **Bun.js** (tùy chọn, có thể dùng Node)

### Cài Đặt Tự Động
Chạy file `run.bat` để tự động cài đặt tất cả:

```bash
run.bat
```

File này sẽ:
1. Kiểm tra Node.js
2. Kiểm tra Python
3. Cài đặt uv (nếu thiếu)
4. Tạo Python venv
5. Cài đặt ZeroTTS
6. Cài đặt Node dependencies
7. Chạy server

## 📖 Sử Dụng

### Chạy Server
```bash
run.bat
```

### Test Mode (Không live)
```bash
test.bat
```

### Kết Nối TikTok Live
1. Mở http://localhost:3000
2. Nhập @username TikTok đang live
3. Bấm "Kết Nối"
4. Người xem tương tác → server tự động xử lý

### Live TikTok với OBS
1. Chạy `run.bat`
2. Mén hỉnh màn hình: http://localhost:3000/?obs=1
3. Cấu hình OBS:
   - Add Source → Browser
   - URL: http://localhost:3000/?obs=1
   - Width: 1080
   - Height: 1920
4. Chia sẻ màn hình lên TikTok Live Studio

## 📁 Cấu Trúc Dự Án

```
Chua-TikTok-Live/
├── server.js              # Server chính (Express + Socket.IO)
├── tts_worker.py          # Giọng đọc AI (ZeroTTS)
├── package.json           # Dependencies
├── LICENSE                # MIT License
├── README.md              # Hướng dẫn
├── CREDITS.md             # Tài nguyên & License chi tiết
├── CONTRIBUTING.md        # Hướng dẫn đóng góp
├── run.bat                # Full setup & run
├── test.bat               # Test mode
├── .gitignore             # Git ignore
├── .github/               # GitHub configs
│   ├── workflows/         # CI/CD
│   └── ISSUE_TEMPLATE/    # Mẫu báo lỗi/đề xuất
├── public/
│   ├── index.html         # Màn hình chính
│   ├── admin.html         # Bảng điều khiển
│   ├── test.html          # Test page
│   ├── assets/            # Ảnh, nhạc nền
│   ├── css/               # Styles
│   └── js/                # JavaScript
└── data/                  # Dữ liệu runtime
    ├── merit-state.json   # Trạng thái công đức
    └── tts-cache/         # Cache giọng đọc
```

## 🔧 Cấu Hình

### Mặc Định
- Port: 3000
- TikTok Username: thanhtrungnguyendanh
- Giọng TTS: Mai Chi (ZeroTTS)

### Thay Đổi
- Chỉnh sửa trong `server.js` (dòng 275, 1271)
- Chỉnh sửa trong `public/index.html` (dòng 225)

## 📜 License

MIT License - Xem file LICENSE chi tiết

## ⚠️ Lưu Ý Quan Trọng

### Pháp Luật & Chính Sách
- ✅ Sử dụng hình ảnh/avatar TikTok theo chính sách TikTok (chỉ hiển thị, không lưu trái phép)
- ✅ Giọng đọc AI không nhại người thật
- ✅ Không thu phí từ người xem
- ✅ Không gửi tin nhắn tự động
- ✅ Tôn trọng nghi lễ Phật giáo truyền thống
- ✅ Tài nguyên ảnh/nhạc do tác giả dự án tạo ra (xem CREDITS.md chi tiết)

### Lưu Ý Kỹ Thuật
- Chỉ kết nối với phòng TikTok đang live (đúng phép công khai)
- Không thu thập thông tin cá nhân người xem
- Reset công đức mỗi phiên live để công bằng
- Không sử dụng API trái phép (TikTok Live Connector là open source)

## 🤝 Đóng Góp

Đóng góp bằng cách:
- Report bug
- Gửi pull request
- Đề xuất tính năng mới

## 📞 Liên Hệ

- GitHub: https://github.com/NgDanhThanhTrung/Chua_Online

---

**Chúc bạn live TikTok thành công!** 🪷✨
