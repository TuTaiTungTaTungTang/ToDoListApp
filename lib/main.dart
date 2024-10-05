import 'package:ct484_project/constants/colors.dart';
import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/user.dart'; // Đảm bảo import trang User
import './shared/app_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: tdBGColor,
          title: Center(
            child: Text(
              'To Do List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24, // Kích thước chữ lớn hơn
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserPage(), // Chuyển đến trang User
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Bo góc
                child: Image.asset(
                  'assets/images/z5454229034776_1d84ce7f2709be82c56d968a422066ef.jpg', // Thay đường dẫn hình ảnh của bạn
                  height: 40, // Chiều cao hình ảnh
                  width: 40, // Chiều rộng hình ảnh
                ),
              ),
            ),
          ],
        ),
        backgroundColor: tdBGColor,
        drawer: AppDrawer(),
        body: Home(),
      ),
    );
  }
}
