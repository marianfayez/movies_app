class FirebaseSignUpRequestModel {
  FirebaseSignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    this.phone,
  });

  final String name;
  final String email;
  final String password;
  final String? phone;
}
