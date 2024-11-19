// import 'dart:io';

// import 'package:ct484_project/shared/slider_drawer.dart' as shared;
// import 'package:ct484_project/view/profile/edit_profile_view.dart';
// import 'package:ct484_project/view/profile/profile_appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import '../../../utils/colors.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:http/http.dart' as http;

// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ProfileViewState createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   String _name = "Huynh Tu Tai";
//   String _title = "Trùm Sylas Việt Nam";
//   String _email = "example@gmail.com";
//   String _phone = "+84 123 456 789";
//   String _address = "Ho Chi Minh City, Vietnam";
//   String _avatarPath = "assets/img/main.jpg";

//   // ignore: unused_field
//   final ValueNotifier<XFile?> _selectedImage = ValueNotifier<XFile?>(null);

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _avatarPath = image.path;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     GlobalKey<SliderDrawerState> dKey = GlobalKey<SliderDrawerState>();

//     return Scaffold(
//       body: SliderDrawer(
//         key: dKey,
//         animationDuration: 500,
//         slider: shared.MySlider(),
//         appBar: profileAppBar(
//           drawerKey: dKey,
//           title: "Profile",
//           titleStyle: const TextStyle(color: Colors.black),
//           titleAlignment: Alignment.center,
//           titlePadding: const EdgeInsets.all(8.0),
//         ),
//         child: _buildProfileContent(context),
//       ),
//     );
//   }

//   Widget _buildProfileContent(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme;

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.grey.shade300,
//                 backgroundImage: _avatarPath.isNotEmpty
//                     ? FileImage(File(_avatarPath))
//                     : const AssetImage('assets/img/main.jpg') as ImageProvider,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               _name,
//               style: textTheme.headlineMedium?.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: MyColors.primaryColor,
//               ),
//             ),
//             Text(
//               _title,
//               style: textTheme.titleMedium?.copyWith(color: Colors.grey),
//             ),
//             const Divider(height: 40, thickness: 1),
//             _buildProfileOption(
//               icon: Icons.email,
//               title: 'Email',
//               subtitle: _email,
//             ),
//             _buildProfileOption(
//               icon: Icons.phone,
//               title: 'Phone',
//               subtitle: _phone,
//             ),
//             _buildProfileOption(
//               icon: Icons.location_on,
//               title: 'Address',
//               subtitle: _address,
//             ),
//             const Divider(height: 40, thickness: 1),
//             _buildButton(
//               context: context,
//               icon: Icons.edit,
//               label: "Edit Profile",
//               onTap: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EditProfileView(
//                       name: _name,
//                       title: _title,
//                       email: _email,
//                       phone: _phone,
//                       address: _address,
//                       avatarPath: _avatarPath,
//                     ),
//                   ),
//                 );

//                 if (result != null) {
//                   setState(() {
//                     _name = result['name'];
//                     _title = result['title'];
//                     _email = result['email'];
//                     _phone = result['phone'];
//                     _address = result['address'];
//                     _avatarPath = result['avatarPath'];
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileOption({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//   }) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: MyColors.primaryColor.withOpacity(0.2),
//         child: Icon(icon, color: MyColors.primaryColor),
//       ),
//       title: Text(title),
//       subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
//       contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//     );
//   }

//   Widget _buildButton({
//     required BuildContext context,
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return ElevatedButton.icon(
//       onPressed: onTap,
//       icon: Icon(icon, color: Colors.white),
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.white),
//       ),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: MyColors.primaryColor,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:ct484_project/data/firestor.dart';
import 'package:ct484_project/shared/slider_drawer.dart' as shared;
import 'package:ct484_project/view/profile/edit_profile_view.dart';
import 'package:ct484_project/view/profile/profile_appbar.dart';
import 'package:ct484_project/utils/colors.dart';
import 'package:ct484_project/models/profileuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String _name = "";
  String _title = "";
  String _email = "";
  String _phone = "";
  String _address = "";
  String _avatarPath = "";

  final Firestore_Datasource _firestoreDatasource = Firestore_Datasource();

  // Load profile from Firestore
  Future<void> _loadProfile() async {
    Profile? profile = await _firestoreDatasource.getProfile();
    if (profile != null) {
      setState(() {
        _name = profile.name;
        _title = profile.title;
        _email = profile.email;
        _phone = profile.phone;
        _address = profile.address;
        _avatarPath = profile.avatarPath;
      });
    }
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
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderDrawerState> dKey = GlobalKey<SliderDrawerState>();

    return Scaffold(
      body: SliderDrawer(
        key: dKey,
        animationDuration: 500,
        slider: shared.MySlider(),
        appBar: profileAppBar(
          drawerKey: dKey,
          title: "Profile",
          titleStyle: const TextStyle(color: Colors.black),
          titleAlignment: Alignment.center,
          titlePadding: const EdgeInsets.all(8.0),
        ),
        child: _buildProfileContent(context),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: _avatarPath.isNotEmpty
                    ? FileImage(File(_avatarPath))
                    : null,
                child: _avatarPath.isEmpty
                    ? const Icon(Icons.camera_alt, size: 40)
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _name,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor,
              ),
            ),
            Text(
              _title,
              style: textTheme.titleMedium?.copyWith(color: Colors.grey),
            ),
            const Divider(height: 40, thickness: 1),
            _buildProfileOption(
              icon: Icons.email,
              title: 'Email',
              subtitle: _email,
            ),
            _buildProfileOption(
              icon: Icons.phone,
              title: 'Phone',
              subtitle: _phone,
            ),
            _buildProfileOption(
              icon: Icons.location_on,
              title: 'Address',
              subtitle: _address,
            ),
            const Divider(height: 40, thickness: 1),
            _buildButton(
              context: context,
              icon: Icons.edit,
              label: "Edit Profile",
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileView(
                      name: _name,
                      title: _title,
                      email: _email,
                      phone: _phone,
                      address: _address,
                      avatarPath: _avatarPath,
                    ),
                  ),
                );

                // Kiểm tra nếu result là một Map<String, dynamic>
                if (result != null && result is Map<String, dynamic>) {
                  Profile updatedProfile = Profile(
                    name: result['name'] ??
                        _name, // Sử dụng giá trị mặc định nếu null
                    title: result['title'] ?? _title,
                    email: result['email'] ?? _email,
                    phone: result['phone'] ?? _phone,
                    address: result['address'] ?? _address,
                    avatarPath: result['avatarPath'] ?? _avatarPath,
                  );

                  // Cập nhật thông tin trong Firestore
                  await _firestoreDatasource.updateProfile(updatedProfile);

                  // Cập nhật UI
                  setState(() {
                    _name = updatedProfile.name;
                    _title = updatedProfile.title;
                    _email = updatedProfile.email;
                    _phone = updatedProfile.phone;
                    _address = updatedProfile.address;
                    _avatarPath = updatedProfile.avatarPath;
                  });
                } else {
                  print("Error: Result is null or not a Map<String, dynamic>");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: MyColors.primaryColor.withOpacity(0.2),
        child: Icon(icon, color: MyColors.primaryColor),
      ),
      title: Text(title),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
