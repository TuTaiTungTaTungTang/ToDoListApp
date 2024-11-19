import 'package:ct484_project/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ct484_project/data/auth_data.dart';
import 'package:ct484_project/utils/colors.dart';

// ignore: camel_case_types
class SignUp_Screen extends StatefulWidget {
  final VoidCallback show;
  const SignUp_Screen(this.show, {super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

// ignore: camel_case_types
class _SignUp_ScreenState extends State<SignUp_Screen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();
  // ignore: non_constant_identifier_names
  final PasswordConfirm = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
    _focusNode3.addListener(() {
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
              SizedBox(height: 20),
              image(),
              SizedBox(height: 50),
              textfield(email, _focusNode1, 'Email', Icons.email),
              SizedBox(height: 10),
              textfield(password, _focusNode2, 'Password', Icons.password),
              SizedBox(height: 10),
              textfield(PasswordConfirm, _focusNode3, 'Confirm Password',
                  Icons.password),
              SizedBox(height: 8),
              account(),
              SizedBox(height: 20),
              SignUP_bottom(),
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
            "Already have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              'Login',
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
  Widget SignUP_bottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (_validateInputs()) {
            AuthenticationRemote()
                .register(email.text, password.text, PasswordConfirm.text)
                .then((_) {
              Fluttertoast.showToast(
                msg: "Registration Successful!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
              Navigator.pushReplacement(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const HomeView()), // Chuyển đến HomeView sau khi đăng ký thành công
              );
            }).catchError((e) {
              Fluttertoast.showToast(
                msg: e.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Sign Up',
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

  bool _validateInputs() {
    if (email.text.isEmpty ||
        password.text.isEmpty ||
        PasswordConfirm.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please fill in all fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      return false;
    }
    if (password.text != PasswordConfirm.text) {
      Fluttertoast.showToast(
          msg: "Passwords do not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      return false;
    }
    return true;
  }

  Widget textfield(TextEditingController controller, FocusNode focusNode,
      String typeName, IconData iconss) {
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
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(
                iconss,
                color: focusNode.hasFocus
                    ? MyColors.primaryColor
                    : Color(0xffc5c5c5),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: typeName,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
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
              )),
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
          image: DecorationImage(
            image: AssetImage('assets/img/7.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
