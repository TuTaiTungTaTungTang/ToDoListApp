import 'package:flutter/material.dart';
import './screens/home.dart';
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
        appBar: AppBar(title: Text('ToDo List')),
        drawer: AppDrawer(), // Sử dụng AppDrawer ở đây
        body: Home(), // Thay thế bằng widget Home của bạn
      ),
    );
  }
}
