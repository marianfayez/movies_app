import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/profile_tab/data/data_sources/remote/favorite_remote_ds.dart';

@Injectable(as: FavoriteRemoteDs)
class FavoriteRemoteDsImpl implements FavoriteRemoteDs {
  final FirebaseFirestore _firestore;

  FavoriteRemoteDsImpl(this._firestore);

  @override
  Future<List<int>> getFavorite(int userId) async {
    try {
      final doc = await _firestore.collection("users").doc(userId).get();
      final data = doc.data();
      final favorites = List<int>.from(data?["favorites"] ?? []);
      return favorites;
    } on DioException catch (e) {
      throw RemoteFailures(e.message ?? "Server Error");
    }
  }
}
