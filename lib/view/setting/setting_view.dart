import 'package:ct484_project/main.dart';
import 'package:ct484_project/shared/slider_drawer.dart' as shared;
import 'package:ct484_project/view/setting/setting_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../../utils/colors.dart';
import 'notification_view.dart';
import 'privacy_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  /// Theo dõi trạng thái hiện tại của Dark Mode
  bool isDarkMode = MyApp.themeNotifier.value == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderDrawerState> dKey = GlobalKey<SliderDrawerState>();

    return Scaffold(
      backgroundColor:
          isDarkMode ? Colors.black : Colors.white, // Cập nhật màu nền
      body: SliderDrawer(
        key: dKey,
        animationDuration: 500,
        slider: shared.MySlider(),
        appBar: SettingAppBar(
          drawerKey: dKey,
          title: "Settings",
        ),
        child: _buildSettingContent(context),
      ),
    );
  }

  /// Nội dung chính của Settings
  Widget _buildSettingContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        /// Tùy chọn Notifications
        _buildSettingOption(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage notification settings',
          onTap: () => _navigateToPage(context, const NotificationsPage()),
        ),

        /// Tùy chọn Privacy
        _buildSettingOption(
          icon: Icons.privacy_tip,
          title: 'Privacy',
          subtitle: 'Review privacy settings',
          onTap: () => _navigateToPage(context, const PrivacyPage()),
        ),

        /// Tùy chọn Language
        _buildSettingOption(
          icon: Icons.language,
          title: 'Language',
          subtitle: 'Change app language',
          onTap: () => _showLanguageDialog(context),
        ),

        const Divider(color: Colors.grey),

        /// Dark Mode Toggle
        _buildDarkModeToggle(),
      ],
    );
  }

  Widget _buildDarkModeToggle() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: MyColors.primaryColor.withOpacity(0.2),
        child: Icon(
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
          color: MyColors.primaryColor,
        ),
      ),
      title: Text(
        'Dark Mode',
        style: TextStyle(
            color:
                isDarkMode ? Colors.white : Colors.black), // Cập nhật màu chữ
      ),
      subtitle: Text(
        isDarkMode ? 'Enabled' : 'Disabled',
        style: TextStyle(
            color:
                isDarkMode ? Colors.white : Colors.black), // Cập nhật màu chữ
      ),
      trailing: Switch(
        value: isDarkMode,
        activeColor: MyColors.primaryColor,
        onChanged: (value) {
          setState(() {
            isDarkMode = value;

            /// Cập nhật ThemeMode toàn cục
            MyApp.themeNotifier.value =
                isDarkMode ? ThemeMode.dark : ThemeMode.light;
          });
        },
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }

  Widget _buildSettingOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: MyColors.primaryColor.withOpacity(0.2),
        child: Icon(icon, color: MyColors.primaryColor),
      ),
      title: Text(
        title,
        style: TextStyle(
            color:
                isDarkMode ? Colors.white : Colors.black), // Cập nhật màu chữ
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            color:
                isDarkMode ? Colors.white : Colors.black), // Cập nhật màu chữ
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }

  /// Định nghĩa phương thức _navigateToPage
  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Định nghĩa phương thức _showLanguageDialog
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  Navigator.pop(context);
                  _changeLanguage('en');
                },
              ),
              ListTile(
                title: const Text('Vietnamese'),
                onTap: () {
                  Navigator.pop(context);
                  _changeLanguage('vi');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Thêm chức năng thay đổi ngôn ngữ
  void _changeLanguage(String languageCode) {
    // Thêm logic thay đổi ngôn ngữ thực tế nếu cần
    print('Language changed to: $languageCode');
  }
}
