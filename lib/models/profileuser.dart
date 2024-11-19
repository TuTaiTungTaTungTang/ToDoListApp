class Profile {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String address;
  final String avatarPath;

  Profile({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatarPath,
  });

  // Convert Profile object to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'email': email,
      'phone': phone,
      'address': address,
      'avatarPath': avatarPath,
    };
  }

  // Convert Firestore document to Profile object
  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      avatarPath: map['avatarPath'] ?? '',
    );
  }
}
