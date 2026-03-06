import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';

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

  Future<Either<RouteFailures, List<int>>> getHistory(
    String userId,
  );
}
