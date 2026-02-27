import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/data/models/upcoming_movies.dart';

abstract class GetMoviesRepo{

  Future<Either<RouteFailures,PoplarMovieModel>>getMovies();
  Future<Either<RouteFailures,UpcomingMoviesModel>>getUpcomingMovies();


}