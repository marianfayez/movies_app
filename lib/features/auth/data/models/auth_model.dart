import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';

class FirebaseAuthModel {
  FirebaseAuthModel({
    required this.uid,
    required this.email,
    this.user,
  });

  final String uid;
  final String email;
  final FirebaseUserModel? user;
}
