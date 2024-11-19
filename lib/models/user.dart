<<<<<<< HEAD
class User {
  String name;
  String email;
  String? avatarUrl;

  User({
    required this.name,
    required this.email,
    this.avatarUrl,
=======
import 'package:hive/hive.dart';

part 'user.g.dart'; // Đây là phần tự động được tạo bởi Hive

@HiveType(typeId: 1) // Mỗi typeId phải là duy nhất
class UserProfile extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String address;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
>>>>>>> f786b41 (update project final)
  });
}
