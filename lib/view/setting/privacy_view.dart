import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  late SharedPreferences prefs;
  bool locationAccess = true;
  bool cameraAccess = false;
  bool dataSharing = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      locationAccess = prefs.getBool('locationAccess') ?? true;
      cameraAccess = prefs.getBool('cameraAccess') ?? false;
      dataSharing = prefs.getBool('dataSharing') ?? true;
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
          'Privacy Settings',
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
          _buildPrivacyOption(
            title: "Location Access",
            subtitle: "Allow app to access your location",
            isEnabled: locationAccess,
            onChanged: (value) {
              setState(() {
                locationAccess = value;
                _savePreference('locationAccess', value);
              });
            },
          ),
          _buildPrivacyOption(
            title: "Camera Access",
            subtitle: "Allow app to access your camera",
            isEnabled: cameraAccess,
            onChanged: (value) {
              setState(() {
                cameraAccess = value;
                _savePreference('cameraAccess', value);
              });
            },
          ),
          _buildPrivacyOption(
            title: "Data Sharing",
            subtitle: "Share your data with third parties",
            isEnabled: dataSharing,
            onChanged: (value) {
              setState(() {
                dataSharing = value;
                _savePreference('dataSharing', value);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyOption({
    required String title,
    required String subtitle,
    required bool isEnabled,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: isEnabled,
        onChanged: onChanged,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }
}
