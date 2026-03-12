import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/favorite_repo.dart';

@injectable
class FavoriteUseCases {
  FavoriteRepo favoriteRepo;

  FavoriteUseCases(this.favoriteRepo);

  Future<Either<RouteFailures,List<int> >> getFavorite(String userId)=>favoriteRepo.getFavorite(userId);
  Future<Either<RouteFailures, void>> call(
      String userId,
      int movieId,
      bool isFavorite,
      ) {
    return favoriteRepo.toggleFavorite(userId, movieId, isFavorite);
  }
}
