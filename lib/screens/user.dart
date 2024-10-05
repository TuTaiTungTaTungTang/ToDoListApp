import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Text(
          'This is the User Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
