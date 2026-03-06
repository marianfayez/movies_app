
import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';

abstract class FirebaseUserRemoteDS {
  Stream<FirebaseUserModel?> watchUser(String userId);
  Future<void> addUser(FirebaseUserModel user);
  Future<FirebaseUserModel?> getUser(String id);
  Future<void> updateUser(FirebaseUserModel user);
  Future<void> addToHistory(String userId, int movieId);
  Future<void> toggleFavorite(String userId, int movieId, bool isFavorite);
  Future<List<int>> getHistory(String userId);

}
