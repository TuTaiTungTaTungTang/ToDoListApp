// lib/shared/app_drawer.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false, // Ẩn nút quay lại
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('/'); // Điều hướng về màn hình Home
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Thêm điều hướng tới màn hình Settings nếu có
            },
          ),
          // Thêm các mục menu khác nếu cần
        ],
      ),
    );
  }
}
