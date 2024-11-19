import 'dart:io';
import 'package:ct484_project/data/firestor.dart';
import 'package:ct484_project/models/profileuser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/colors.dart';

class EditProfileView extends StatefulWidget {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String address;
  final String avatarPath;

  const EditProfileView({
    super.key,
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatarPath,
  });

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _titleController.text = widget.title;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    _addressController.text = widget.address;
    _avatarPath = widget.avatarPath;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _avatarPath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Edit Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: MyColors.primaryColor,
        iconTheme:
            const IconThemeData(color: Colors.white), // Thay đổi màu nút Back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: _avatarPath != null
                      ? FileImage(File(_avatarPath!))
                      : null,
                  child: _avatarPath == null
                      ? const Icon(Icons.camera_alt, size: 40)
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: "Address"),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  Profile updatedProfile = Profile(
                    name: _nameController.text,
                    title: _titleController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    address: _addressController.text,
                    avatarPath: _avatarPath ?? '',
                  );

                  Firestore_Datasource firestoreDatasource =
                      Firestore_Datasource();

                  try {
                    // Gửi thông tin hồ sơ đã chỉnh sửa lên Firestore
                    await firestoreDatasource.updateProfile(updatedProfile);

                    // Quay lại màn hình trước với thông tin đã chỉnh sửa
                    Navigator.pop(context, updatedProfile);
                    print("Profile updated successfully.");
                  } catch (e) {
                    print("Error updating profile: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Failed to update profile: $e")),
                    );
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
