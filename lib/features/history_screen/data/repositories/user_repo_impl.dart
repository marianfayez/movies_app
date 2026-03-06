import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/firebase_user_remote_ds.dart';
import 'package:movies_app/features/history_screen/domain/repositories/user_repo.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';

@Injectable(as: UserRepo)
class UserRepoImpl implements UserRepo {
  FirebaseUserRemoteDS firebaseUserRemoteDS;

  UserRepoImpl(this.firebaseUserRemoteDS);

  @override
  Future<Either<RouteFailures, void>> addToHistory(
      String userId, int movieId) async {
    try {
      var result = await firebaseUserRemoteDS.addToHistory(userId, movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<RouteFailures, void>> toggleFavorite(
      String userId, int movieId, bool isFavorite) async {
    try {
      var result = await firebaseUserRemoteDS.toggleFavorite(
          userId, movieId, isFavorite);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
  @override
  Future<Either<RouteFailures, List<int>>> getHistory(String userId) async {
    try {
      final result = await firebaseUserRemoteDS.getHistory(userId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
