import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/home_tab/data/data_sources/remote/get_movies_remote_ds.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/data/models/upcoming_movies.dart';
import 'package:movies_app/features/home_tab/domain/repositories/get_movies_repo.dart';

@Injectable(as: GetMoviesRepo)
class GetMoviesRepoImpl implements GetMoviesRepo {
  GetMoviesRemoteDs getMoviesRemoteDs;

  GetMoviesRepoImpl(this.getMoviesRemoteDs);

  @override
  Future<Either<RouteFailures, PoplarMovieModel>> getMovies() async {
    try {
      final result = await getMoviesRemoteDs.getMovies();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<RouteFailures, UpcomingMoviesModel>> getUpcomingMovies() async{
    try {
      final result = await getMoviesRemoteDs.getUpcomingMovies();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
