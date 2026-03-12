import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';


abstract class FavoriteRepo {
  Future<Either<RouteFailures,List<int>>> getFavorite(
      String userId);
  Future<Either<RouteFailures, void>> toggleFavorite(
      String userId,
      int movieId,
      bool isFavorite,
      );

}
