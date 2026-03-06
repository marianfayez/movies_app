

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/favorite_repo.dart';

@Injectable(as: FavoriteRepo)
class FavoriteRepoImpl implements FavoriteRepo {
  FavoriteRemoteDs favoriteRemoteDs;

  FavoriteRepoImpl(this.favoriteRemoteDs);

  @override
  Future<Either<RouteFailures, List<int>>> getFavorite(int userId) async {
    try {
      final result = await favoriteRemoteDs.getFavorite(userId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

}
