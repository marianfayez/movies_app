import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/profile_tab/data/data_sources/remote/get_history_remote_ds.dart';

@Injectable(as: HistoryRemoteDs)
class HistoryRemoteDsImpl implements HistoryRemoteDs {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  HistoryRemoteDsImpl();

  @override
  Future<void> addToHistory(String userId, int movieId) async {
    try {
      final docRef = _firestore.collection("users").doc(userId);

      await docRef.set({
        "history": FieldValue.arrayUnion([movieId]),
        "favorites": FieldValue.arrayUnion([])
      }, SetOptions(merge: true));
      print("Add to history");
    } catch (e) {
      throw RemoteFailures("Failed to add to history: $e");
    }
  }

  @override
  Future<List<int>> getHistory(String userId) async {
    try {
      final doc = await _firestore.collection("users").doc(userId).get();

      final data = doc.data();
      final historyIds = List<int>.from(data?["history"] ?? []);

      return historyIds;
    } catch (e) {
      throw RemoteFailures("Failed to get history");
    }
  }
}
