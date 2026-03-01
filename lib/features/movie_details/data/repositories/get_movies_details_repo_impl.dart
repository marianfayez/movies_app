import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/movie_details/data/data_sources/remote/get_movies_details_remote_ds.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_screen_shot_model.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_model.dart';
import 'package:movies_app/features/movie_details/domain/repositories/get_movies_details_repo.dart';

@Injectable(as: GetMoviesDetailsRepo)
class GetMoviesDetailsRepoImpl implements GetMoviesDetailsRepo {
  GetMoviesDetailsRemoteDs getMoviesDetailsRemoteDs;

  GetMoviesDetailsRepoImpl(this.getMoviesDetailsRemoteDs);

  @override
  Future<Either<RouteFailures, MovieDetailsModel>> getMoviesDetails(int movieId) async {
    try {
      final result = await getMoviesDetailsRemoteDs.getMoviesDetails(movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<RouteFailures, MovieScreenShotModel>> getMovieScreenShot(int movieId) async{
    try {
      final result = await getMoviesDetailsRemoteDs.getMovieScreenShot(movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<RouteFailures, SimilarMoviesModel>> getSimilarMovie(int movieId) async{
    try {
      final result = await getMoviesDetailsRemoteDs.getSimilarMovie(movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
