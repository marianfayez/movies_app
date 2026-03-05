import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/search_tab/domain/repositories/search_repo.dart';

@injectable
class SearchUseCase {
  SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);

  Future<Either<RouteFailures, PoplarMovieModel>> getSearchMovie(String name) =>
      searchRepo.getSearchMovie(name);
}
