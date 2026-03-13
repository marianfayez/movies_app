import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/firebase_user_remote_ds.dart';
import 'package:movies_app/features/profile_tab/data/data_sources/remote/favorite_remote_ds.dart';
import 'package:movies_app/features/profile_tab/data/data_sources/remote/get_history_remote_ds.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/favorite_repo.dart';

@Injectable(as: FavoriteRepo)
class FavoriteRepoImpl implements FavoriteRepo {
  FavoriteRemoteDs favoriteRemoteDs;

  FavoriteRepoImpl(this.favoriteRemoteDs);

  @override
  Future<Either<RouteFailures, void>> toggleFavorite(
      String userId, int movieId, bool isFavorite) async {
    try {
      var result =
          await favoriteRemoteDs.toggleFavorite(userId, movieId, isFavorite);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<RouteFailures, List<int>>> getFavorite(String userId) async {
    try {
      final result = await favoriteRemoteDs.getFavorite(userId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
