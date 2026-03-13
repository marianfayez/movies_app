import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';

abstract class HistoryRepo {
  Future<Either<RouteFailures, void>> addToHistory(
      String userId,
      int movieId,
      );



  Future<Either<RouteFailures, List<int>>> getHistory(
      String userId,
      );
}
