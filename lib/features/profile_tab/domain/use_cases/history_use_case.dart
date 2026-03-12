import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/history_repo.dart';

@injectable
class HistoryUseCase {

  final HistoryRepo historyRepo;

  HistoryUseCase(this.historyRepo);

  Future<Either<RouteFailures, void>> call(
      String userId,
      int movieId,
      ) {
    return historyRepo.addToHistory(userId, movieId);
  }

  Future<Either<RouteFailures, List<int>>> getHistory(String userId) {
    return historyRepo.getHistory(userId);
  }
}