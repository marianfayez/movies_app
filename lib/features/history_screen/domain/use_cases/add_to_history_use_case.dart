import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/history_screen/domain/repositories/user_repo.dart';

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
}