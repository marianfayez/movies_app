import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/history_screen/domain/repositories/user_repo.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';

@injectable
class AddToHistoryUseCase {

  final UserRepo repo;

  AddToHistoryUseCase(this.repo);

  Future<Either<RouteFailures, void>> call(
      String userId,
      int movieId,
      ) {
    return repo.addToHistory(userId, movieId);
  }

  Future<Either<RouteFailures, List<Results>>> getHistory(String userId) {
    return repo.getHistory(userId);
  }
}