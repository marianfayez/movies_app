import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/domain/repositories/get_movies_repo.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';

@injectable
class GetMoviesUseCase {
  GetMoviesRepo getMoviesRepo;

  GetMoviesUseCase(this.getMoviesRepo);

  Future<Either<RouteFailures, PoplarMovieModel>> call() {
    return getMoviesRepo.getMovies();
  }
}
