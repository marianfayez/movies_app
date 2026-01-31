import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';


class FirebaseUserRemoteDS {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<FirebaseUserModel> getUsersCollection() {
    return _firestore.collection("users").withConverter<FirebaseUserModel>(
      fromFirestore: (snapshot, _) => FirebaseUserModel.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
  }

  Future<void> addUser(FirebaseUserModel user) async {
    try {
      await getUsersCollection().doc(user.id).set(user);
    } catch (e) {
      throw RemoteFailures("Failed to add user: $e");
    }
  }

  Future<FirebaseUserModel?> getUser(String id) async {
    try {
      final snapshot = await getUsersCollection().doc(id).get();
      if (snapshot.exists) return snapshot.data();
      return null;
    } catch (e) {
      throw RemoteFailures("Failed to fetch user: $e");
    }
  }

  Future<void> updateUser(FirebaseUserModel user) async {
    if (user.id.isEmpty) throw RemoteFailures("Document ID cannot be empty");
    try {
      await getUsersCollection().doc(user.id).update(user.toJson());
    } catch (e) {
      throw RemoteFailures("Failed to update user: $e");
    }
  }
}
