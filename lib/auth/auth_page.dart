import 'package:flutter/material.dart';
import 'package:ct484_project/view/login/login.dart';
import 'package:ct484_project/view/login/signup.dart';

// ignore: camel_case_types
class Auth_Page extends StatefulWidget {
  const Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

// ignore: camel_case_types
class _Auth_PageState extends State<Auth_Page> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LogIN_Screen(to);
    } else {
      return SignUp_Screen(to);
    }
  }
}
