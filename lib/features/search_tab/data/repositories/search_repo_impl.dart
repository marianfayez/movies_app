import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/search_tab/data/data_sources/remote/search_remote_ds.dart';
import 'package:movies_app/features/search_tab/domain/repositories/search_repo.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  SearchRemoteDs searchRemoteDs;

  SearchRepoImpl(this.searchRemoteDs);

  @override
  Future<Either<RouteFailures, PoplarMovieModel>> getSearchMovie(
      String name) async {
    try {
      final result = await searchRemoteDs.getSearchMovie(name);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
