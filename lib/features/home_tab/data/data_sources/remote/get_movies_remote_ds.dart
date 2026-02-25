import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';

abstract class GetMoviesRemoteDs {
  Future<PoplarMovieModel> getMovies();
}
