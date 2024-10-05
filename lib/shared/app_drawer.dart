// // lib/shared/app_drawer.dart
// import 'package:ct484_project/constants/colors.dart';
// import 'package:flutter/material.dart';

// class AppDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           AppBar(
//             title: Text('Menu'),
//             automaticallyImplyLeading: false, // Ẩn nút quay lại
//             backgroundColor:
//                 tdBGColor, // Sử dụng màu tdPurple từ file colors.dart
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text('Home'),
//             onTap: () {
//               Navigator.of(context)
//                   .pushReplacementNamed('/'); // Điều hướng về màn hình Home
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () {
//               // Thêm điều hướng tới màn hình Settings nếu có
//             },
//           ),
//           // Thêm các mục menu khác nếu cần
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../screens/user.dart'; // Import trang User
import '../constants/colors.dart'; // Import màu từ file colors.dart

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
            backgroundColor:
                tdBGColor, // Sử dụng màu tdPurple từ file colors.dart
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
            leading: Icon(Icons.person), // Biểu tượng cho trang User
            title: Text('User'), // Tiêu đề cho mục User
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserPage(), // Chuyển đến trang User
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Thêm điều hướng tới màn hình Settings nếu có
            },
          ),
        ],
      ),
    );
  }
}
