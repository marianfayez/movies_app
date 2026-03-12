class FirebaseUserModel {
  FirebaseUserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.role = 'user',
    required this.avatarId,
    required this.createdAt,
  });

  final String id; // Firebase UID
  final String name;
  final String email;
  final String? phone;
  final String role;
  final int createdAt;
  final int avatarId;

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) {
    return FirebaseUserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'] ?? 'user',
      createdAt: json['createdAt'],
      avatarId: json['avatarId'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'createdAt': createdAt,
      'avatarId': avatarId,
    };
  }
}
