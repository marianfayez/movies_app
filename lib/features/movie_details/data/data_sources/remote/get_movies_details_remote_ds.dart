
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_screen_shot_model.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_model.dart';

abstract class GetMoviesDetailsRemoteDs {
  Future<MovieDetailsModel> getMoviesDetails(int movieId);
  Future<MovieScreenShotModel> getMovieScreenShot(int movieId);
  Future<SimilarMoviesModel> getSimilarMovie(int movieId);

}
