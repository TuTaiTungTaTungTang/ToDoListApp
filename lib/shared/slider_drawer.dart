import 'package:ct484_project/auth/auth_page.dart';
import 'package:ct484_project/view/detail/detail_view.dart';
import 'package:ct484_project/view/home/home_view.dart';
import 'package:ct484_project/view/profile/profile_view.dart';
import 'package:ct484_project/view/setting/setting_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../utils/colors.dart';

// ignore: must_be_immutable
class MySlider extends StatelessWidget {
  MySlider({
    super.key,
  });

  List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
    Icons.exit_to_app, // Icon for Log Out
  ];

  List<String> texts = [
    "Home",
    "Profile",
    "Settings",
    "Details",
    "Log Out", // Log Out text
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: MyColors.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/img/main.jpg'),
          ),
          const SizedBox(height: 8),
          Text("Huynh Tu Tai", style: textTheme.displayMedium),
          Text("Trùm sylas Viet Nam", style: textTheme.displaySmall),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            width: double.infinity,
            height: 350,
            child: ListView.builder(
              itemCount: icons.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                return InkWell(
                  onTap: () async {
                    if (texts[i] == "Log Out") {
                      // Đảm bảo đăng xuất hoàn tất trước khi chuyển hướng
                      await FirebaseAuth.instance.signOut();
                      // Chuyển hướng về màn hình đăng nhập
                      Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Auth_Page()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            if (texts[i] == "Home") {
                              return const HomeView();
                            } else if (texts[i] == "Profile") {
                              return const ProfileView();
                            } else if (texts[i] == "Settings") {
                              return const SettingView();
                            } else if (texts[i] == "Details") {
                              return const DetailView();
                            }
                            return const HomeView(); // Default return statement
                          },
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        icons[i],
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        texts[i],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
