import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/firebase_user_remote_ds.dart';
import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';

@Injectable(as: FirebaseUserRemoteDS)
class FirebaseUserRemoteDSImpl implements FirebaseUserRemoteDS {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<FirebaseUserModel> get _users =>
      _firestore.collection("users").withConverter<FirebaseUserModel>(
            fromFirestore: (snapshot, _) =>
                FirebaseUserModel.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  @override
  Future<void> addUser(FirebaseUserModel user) async {
    try {
      await _users.doc(user.id).set(user);
    } catch (e) {
      throw RemoteFailures("Failed to add user: $e");
    }
  }

  @override
  Future<FirebaseUserModel?> getUser(String id) async {
    try {
      final snapshot = await _users.doc(id).get();
      return snapshot.data();
    } catch (e) {
      throw RemoteFailures("Failed to fetch user: $e");
    }
  }

  @override
  Future<void> updateUser(FirebaseUserModel user) async {
    try {
      await _users.doc(user.id).update(user.toJson());
    } catch (e) {
      throw RemoteFailures("Failed to update user: $e");
    }
  }

  @override
  Stream<FirebaseUserModel?> watchUser(String userId) {
    return _users.doc(userId).snapshots().map((snapshot) {
      return snapshot.data();
    });
  }

  @override
  Future<void> deleteUser(String userId) async {
    try {
      await _users.doc(userId).delete();
    } catch (e) {
      throw RemoteFailures("Failed to delete user: $e");
    }
  }

  @override
  Future<FirebaseUserModel> getOrCreateUser(User firebaseUser) async {
    try {
      final existingUser = await getUser(firebaseUser.uid);
      if (existingUser != null) {
        return existingUser;
      }
      final newUser = FirebaseUserModel(
        id: firebaseUser.uid,
        name: firebaseUser.displayName ?? "No Name",
        email: firebaseUser.email ?? "",
        phone: firebaseUser.phoneNumber,
        avatarId: 0,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      await addUser(newUser);
      return newUser;
    } catch (e) {
      throw RemoteFailures("Failed in getOrCreateUser: $e");
    }
  }
}
