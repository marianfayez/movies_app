class FirebaseSignUpRequestModel {
  FirebaseSignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.avatarId,

  });

  final String name;
  final String email;
  final String password;
  final String? phone;
  final int avatarId;

}
