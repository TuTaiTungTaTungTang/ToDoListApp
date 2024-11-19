import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late SharedPreferences prefs;
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool smsNotifications = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      pushNotifications = prefs.getBool('pushNotifications') ?? true;
      emailNotifications = prefs.getBool('emailNotifications') ?? false;
      smsNotifications = prefs.getBool('smsNotifications') ?? true;
    });
  }

  Future<void> _savePreference(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationOption(
            title: "Push Notifications",
            subtitle: "Receive push notifications",
            value: pushNotifications,
            onChanged: (value) {
              setState(() {
                pushNotifications = value;
                _savePreference('pushNotifications', value);
              });
            },
          ),
          _buildNotificationOption(
            title: "Email Notifications",
            subtitle: "Receive email notifications",
            value: emailNotifications,
            onChanged: (value) {
              setState(() {
                emailNotifications = value;
                _savePreference('emailNotifications', value);
              });
            },
          ),
          _buildNotificationOption(
            title: "SMS Notifications",
            subtitle: "Receive SMS notifications",
            value: smsNotifications,
            onChanged: (value) {
              setState(() {
                smsNotifications = value;
                _savePreference('smsNotifications', value);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationOption({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }
}
