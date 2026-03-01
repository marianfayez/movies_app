import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_screen_shot_model.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_model.dart';
import 'package:movies_app/features/movie_details/domain/repositories/get_movies_details_repo.dart';

@injectable
class MoviesDetailsUseCase {
  GetMoviesDetailsRepo getMoviesDetailsRepo;

  MoviesDetailsUseCase(this.getMoviesDetailsRepo);

  Future<Either<RouteFailures, MovieDetailsModel>> getMoviesDetails(int movieId)=>getMoviesDetailsRepo.getMoviesDetails(movieId);
  Future<Either<RouteFailures, MovieScreenShotModel>> getMovieScreenShot(int movieId)=>getMoviesDetailsRepo.getMovieScreenShot(movieId);
  Future<Either<RouteFailures, SimilarMoviesModel>> getSimilarMovie(int movieId)=>getMoviesDetailsRepo.getSimilarMovie(movieId);

}
