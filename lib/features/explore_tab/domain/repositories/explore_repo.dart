import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/explore_tab/data/models/explore_list_model.dart';
import 'package:movies_app/features/explore_tab/data/models/explore_movies_model.dart';

abstract class ExploreRepo {
  Future<Either<RouteFailures, ExploreListModel>> getExploreList();
  Future<Either<RouteFailures, ExploreMoviesModel>> getExploreMovies(int sourceId);

}
