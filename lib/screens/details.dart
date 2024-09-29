import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Center(
        child: const Text(
          'Welcome to the Details Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
