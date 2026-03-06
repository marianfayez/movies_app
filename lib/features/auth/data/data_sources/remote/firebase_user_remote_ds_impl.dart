import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/firebase_user_remote_ds.dart';
import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/presentation/bloc/get_movies_bloc.dart';

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
  Future<void> addToHistory(String userId, int movieId) async {
    try {
      final docRef = _firestore.collection("users").doc(userId);

      await docRef.set({
        "history": FieldValue.arrayUnion([movieId]),
        "favorites": FieldValue.arrayUnion([])
      },SetOptions(merge: true));
      print("Add to history");
    } catch (e) {
      throw RemoteFailures("Failed to add to history: $e");
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
  @override
  Stream<FirebaseUserModel?> watchUser(String userId) {
    return _users.doc(userId).snapshots().map((snapshot) {
      return snapshot.data();
    });
  }
  @override
  Future<List<Results>> getHistory(String userId) async {
    try {
      final doc = await _firestore.collection("users").doc(userId).get();

      final data = doc.data();
      final historyIds = List<int>.from(data?["history"] ?? []);
      final allMovies = getIt<GetMoviesBloc>().state.poplarMovieModel?.results ?? [];
      final historyMovies = allMovies.where((movie) => historyIds.contains(movie.id)).toList();

      return historyMovies;
    } catch (e) {
      throw RemoteFailures("Failed to get history");
    }
  }
}
