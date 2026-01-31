import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';

abstract class FirebaseUserRemoteDS {
  Future<void> addUser(FirebaseUserModel user);
  Future<FirebaseUserModel?> getUser(String id);
  Future<void> updateUser(FirebaseUserModel user);
}
