
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';

abstract class GetMoviesDetailsRemoteDs {
  Future<MovieDetailsModel> getMoviesDetails(String movieId);

}
