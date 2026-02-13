import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/auth_remote_ds.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/firebase_user_remote_ds.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/firebase_sign_up_request_model.dart';
import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl implements AuthRemoteDs {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseUserRemoteDS _userDS;

  AuthRemoteDsImpl(this._userDS);

  @override
  Future<FirebaseAuthModel> logIn({required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;
      FirebaseUserModel firebaseUser;
      try {
        firebaseUser = await _userDS.getUser(user.uid) ??
            FirebaseUserModel(
              id: user.uid,
              name: user.displayName ?? '',
              email: user.email ?? '',
              phone: '',
              avatarId: 0,
              createdAt: DateTime.now().millisecondsSinceEpoch,
            );
      } catch (e) {
        firebaseUser = FirebaseUserModel(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          phone: '',
          avatarId: 0,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
      }
      return FirebaseAuthModel(
          uid: user.uid, email: user.email!, user: firebaseUser);
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        message = 'Email or password is not valid';
      } else {
        message = e.message ?? 'Something went wrong';
      }
      throw RemoteFailures(message);
    } catch (e) {
      throw RemoteFailures(e.toString());
    }
  }

  @override
  Future<FirebaseAuthModel> signUp({required FirebaseSignUpRequestModel request}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      final user = credential.user!;

      final firebaseUser = FirebaseUserModel(
        id: user.uid,
        name: request.name,
        email: request.email,
        phone: request.phone,
        avatarId: request.avatarId,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      await _userDS.addUser(firebaseUser);

      return FirebaseAuthModel(
        uid: user.uid,
        email: user.email!,
        user: firebaseUser,
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message ?? 'Something went wrong';
      }
      throw RemoteFailures(message);
    } catch (e) {
      throw RemoteFailures(e.toString());
    }
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw RemoteFailures(e.message);
    } catch (e) {
      throw RemoteFailures(e.toString());
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final user = _firebaseAuth.currentUser;
    return user != null;
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw RemoteFailures(e.toString());
    }
  }

  @override
  Future<FirebaseAuthModel> logInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw RemoteFailures("Google sign in cancelled");
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final user = userCredential.user!;
      FirebaseUserModel firebaseUser;
      try {
        firebaseUser = await _userDS.getUser(user.uid) ??
            FirebaseUserModel(
              id: user.uid,
              name: user.displayName ?? '',
              email: user.email ?? '',
              phone: '',
              avatarId: 0,
              createdAt: DateTime.now().millisecondsSinceEpoch,
            );
      } catch (e) {
        firebaseUser = FirebaseUserModel(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          phone: '',
          avatarId: 0,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
      }

      await _userDS.addUser(firebaseUser);

      return FirebaseAuthModel(
        uid: user.uid,
        email: user.email ?? '',
        user: firebaseUser,
      );
    } on FirebaseAuthException catch (e) {
      throw RemoteFailures(e.message ?? 'Google sign in failed');
    } catch (e) {
      throw RemoteFailures(e.toString());
    }
  }
}
