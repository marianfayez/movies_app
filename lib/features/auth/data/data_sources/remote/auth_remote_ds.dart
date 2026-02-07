import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/firebase_sign_up_request_model.dart';

abstract class AuthRemoteDs {
  Future<FirebaseAuthModel> signUp({required FirebaseSignUpRequestModel request});

  Future<FirebaseAuthModel> logIn({required String email, required String password});
  Future<void> forgetPassword(String email);
  Future<void> logOut();
  Future<FirebaseAuthModel> logInWithGoogle();

}
