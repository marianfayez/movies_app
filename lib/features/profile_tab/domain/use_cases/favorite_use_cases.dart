import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/favorite_repo.dart';

@injectable
class FavoriteUseCases {
  FavoriteRepo favoriteRepo;

  FavoriteUseCases(this.favoriteRepo);

  Future<Either<RouteFailures,List<int> >> getFavorite(int userId)=>favoriteRepo.getFavorite(userId);

}
