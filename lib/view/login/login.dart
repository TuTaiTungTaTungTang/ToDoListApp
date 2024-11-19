import 'package:ct484_project/data/auth_data.dart';
import 'package:ct484_project/view/home/home_view.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class LogIN_Screen extends StatefulWidget {
  final VoidCallback show;
  const LogIN_Screen(this.show, {super.key});

  @override
  State<LogIN_Screen> createState() => _LogIN_ScreenState();
}

// ignore: camel_case_types
class _LogIN_ScreenState extends State<LogIN_Screen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              image(),
              const SizedBox(height: 50),
              textfield(email, _focusNode1, 'Email', Icons.email),
              const SizedBox(height: 10),
              textfield(password, _focusNode2, 'Password', Icons.lock,
                  isPassword: true),
              const SizedBox(height: 8),
              account(),
              const SizedBox(height: 20),
              Login_bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: widget.show,
            child: const Text(
              'Sign UP',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Login_bottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          _loginUser();
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'LogIn',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    try {
      await AuthenticationRemote().login(email.text, password.text);
      Fluttertoast.showToast(
        msg: "Login Successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Invalid email or password. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  Widget textfield(TextEditingController controller, FocusNode focusNode,
      String typeName, IconData iconss,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: isPassword && _isPasswordHidden,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              iconss,
              color: focusNode.hasFocus
                  ? MyColors.primaryColor
                  : const Color(0xffc5c5c5),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: _isPasswordHidden
                          ? Colors.grey
                          : MyColors.primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: MyColors.primaryColor,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: MyColors().backgroundColors,
          image: const DecorationImage(
            image: AssetImage('assets/img/7.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
