import 'package:hive/hive.dart';

part 'profile_hive.g.dart';

@HiveType(typeId: 1) // Thêm typeId cho Hive
class Profile {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String address;
  @HiveField(5)
  final String avatarPath;

  Profile({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatarPath,
  });
}
