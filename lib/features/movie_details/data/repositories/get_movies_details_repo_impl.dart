import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/movie_details/data/data_sources/remote/get_movies_details_remote_ds.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/domain/repositories/get_movies_details_repo.dart';

@Injectable(as: GetMoviesDetailsRepo)
class GetMoviesDetailsRepoImpl implements GetMoviesDetailsRepo {
  GetMoviesDetailsRemoteDs getMoviesDetailsRemoteDs;

  GetMoviesDetailsRepoImpl(this.getMoviesDetailsRemoteDs);

  @override
  Future<Either<RouteFailures, MovieDetailsModel>> getMoviesDetails(String movieId) async {
    try {
      final result = await getMoviesDetailsRemoteDs.getMoviesDetails(movieId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
