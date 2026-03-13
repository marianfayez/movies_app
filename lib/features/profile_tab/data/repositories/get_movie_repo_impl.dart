import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/home_tab/data/models/movie_model.dart';
import 'package:movies_app/features/profile_tab/data/data_sources/remote/get_movie_remote_ds.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/get_movie_repo.dart';

@Injectable(as: GetMovieRepo)
class GetMovieRepoImpl implements GetMovieRepo {
  GetMovieRemoteDs getMovieRemoteDs;

  GetMovieRepoImpl(this.getMovieRemoteDs);

  @override
  Future<Either<RouteFailures, List<MovieModel>>> getMoviesDetails(List<int> ids) async {
    try {
      List<MovieModel> movies = [];

      for (var id in ids) {
        final movie = await getMovieRemoteDs.getMoviesById(id);
        movies.add(movie);
      }

      return Right(movies);

    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

}
