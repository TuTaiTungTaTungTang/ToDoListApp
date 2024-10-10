import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user.dart'; // Đảm bảo đường dẫn đến mô hình User là chính xác
import '../constants/colors.dart';
import '../shared/app_drawer.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late User user; // Người dùng hiện tại
  final picker = ImagePicker();
  File? _image; // Biến để lưu trữ hình ảnh đã chọn

  @override
  void initState() {
    super.initState();
    // Giả sử bạn lấy thông tin người dùng từ một nguồn nào đó
    user = User(name: 'Nguyễn Văn A', email: 'nguyenvana@example.com');
  }

  Future<void> _chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Lưu trữ hình ảnh đã chọn
      });
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Lưu trữ hình ảnh đã chụp
      });
    }
  }

  void _updateProfile() {
    // Thực hiện cập nhật thông tin người dùng (ví dụ: lưu vào cơ sở dữ liệu)
    // Cần thêm mã xử lý để lưu thông tin vào cơ sở dữ liệu hoặc API
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor, // Sử dụng màu nền giống như trong Home
      drawer: AppDrawer(), // Sử dụng AppDrawer ở đây
      appBar: _buildAppBar(), // Sử dụng AppBar tương tự như ToDo List
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _chooseImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tên',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: user.name),
              onChanged: (value) {
                user.name = value; // Cập nhật tên người dùng
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: user.email),
              onChanged: (value) {
                user.email = value; // Cập nhật email người dùng
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              child: Text('Cập nhật thông tin'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor:
          tdBGColor, // Đảm bảo rằng màu nền giống với màu nền của body
      elevation: 0,
      centerTitle: true, // Căn giữa tiêu đề
      title: Text(
        'Thông Tin Cá Nhân', // Tiêu đề của trang
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10), // Căn lề phải cho ảnh avatar
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
                'assets/images/z5454229034776_1d84ce7f2709be82c56d968a422066ef.jpg'), // Sử dụng ảnh avatar
          ),
        ),
      ],
    );
  }
}
