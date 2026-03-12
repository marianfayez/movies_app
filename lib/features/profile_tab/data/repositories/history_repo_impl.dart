import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/profile_tab/data/data_sources/remote/history_remote_ds.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/history_repo.dart';

@Injectable(as: HistoryRepo)
class HistoryRepoImpl implements HistoryRepo {
  HistoryRemoteDs historyRemoteDs;

  HistoryRepoImpl(this.historyRemoteDs);

  @override
  Future<Either<RouteFailures, void>> addToHistory(
      String userId, int movieId) async {
    try {
      var result = await historyRemoteDs.addToHistory(userId, movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }


  @override
  Future<Either<RouteFailures, List<int>>> getHistory(String userId) async {
    try {
      final result = await historyRemoteDs.getHistory(userId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
