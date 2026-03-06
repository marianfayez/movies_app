import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';


abstract class FavoriteRepo {
  Future<Either<RouteFailures,List<int>>> getFavorite(
      int userId);

}
