
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';

abstract class GetMovieRemoteDs {
  Future<Results> getMoviesById(int movieId);

}
