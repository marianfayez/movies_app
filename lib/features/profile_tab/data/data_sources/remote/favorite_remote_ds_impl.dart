import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/profile_tab/data/data_sources/remote/favorite_remote_ds.dart';

@Injectable(as: FavoriteRemoteDs)
class FavoriteRemoteDsImpl implements FavoriteRemoteDs {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FavoriteRemoteDsImpl();

  @override
  Future<List<int>> getFavorite(String userId) async {
    try {
      final doc = await _firestore.collection("users").doc(userId).get();
      final data = doc.data();
      final favorites = List<int>.from(data?["favorites"] ?? []);
      return favorites;
    }  catch (e) {
      throw RemoteFailures("Server Error");
    }
  }
  @override
  Future<void> toggleFavorite(String userId, int movieId, bool isFavorite) async {
    try {
      await _firestore.collection("users").doc(userId).update({
        "favorites": isFavorite
            ? FieldValue.arrayRemove([movieId])
            : FieldValue.arrayUnion([movieId])
      });
    } catch (e) {
      throw RemoteFailures("Failed to update favorites: $e");
    }
  }
}
