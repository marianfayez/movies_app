
import 'package:movies_app/features/home_tab/data/models/movie_model.dart';

abstract class GetMovieRemoteDs {
  Future<MovieModel> getMoviesById(int movieId);

}
