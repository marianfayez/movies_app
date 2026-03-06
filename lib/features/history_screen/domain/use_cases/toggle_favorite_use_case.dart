import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/history_screen/domain/repositories/user_repo.dart';

@injectable
class ToggleFavoriteUseCase {

  final UserRepo repo;

  ToggleFavoriteUseCase(this.repo);

  Future<Either<RouteFailures, void>> call(
      String userId,
      int movieId,
      bool isFavorite,
      ) {
    return repo.toggleFavorite(userId, movieId, isFavorite);
  }
}