import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/data/models/upcoming_movies.dart';

abstract class GetMoviesRemoteDs {
  Future<PoplarMovieModel> getMovies();
  Future<UpcomingMoviesModel> getUpcomingMovies();

}
