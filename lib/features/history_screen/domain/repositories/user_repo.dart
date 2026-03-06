import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';

abstract class UserRepo {

  Future<Either<RouteFailures, void>> addToHistory(
      String userId,
      int movieId,
      );

  Future<Either<RouteFailures, void>> toggleFavorite(
      String userId,
      int movieId,
      bool isFavorite,
      );
}