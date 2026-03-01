import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_screen_shot_model.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_model.dart';

abstract class GetMoviesDetailsRepo{

  Future<Either<RouteFailures,MovieDetailsModel>>getMoviesDetails(int movieId);
  Future<Either<RouteFailures,MovieScreenShotModel>>getMovieScreenShot(int movieId);

  Future<Either<RouteFailures,SimilarMoviesModel>>getSimilarMovie(int movieId);

}