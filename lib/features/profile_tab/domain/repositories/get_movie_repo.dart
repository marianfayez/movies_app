import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/movie_model.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';


abstract class GetMovieRepo {
  Future<Either<RouteFailures, List<MovieModel>>> getMoviesDetails(
      List<int> ids);

}
