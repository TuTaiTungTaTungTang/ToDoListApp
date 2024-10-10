class User {
  String name;
  String email;
  String? avatarUrl;

  User({
    required this.name,
    required this.email,
    this.avatarUrl,
  });
}
