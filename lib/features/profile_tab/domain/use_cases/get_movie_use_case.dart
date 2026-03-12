import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/get_movie_repo.dart';

@injectable
class GetMovieUseCase {
  GetMovieRepo getMovieRepo;

  GetMovieUseCase(this.getMovieRepo);

  Future<Either<RouteFailures, List<Results>>> getMoviesDetails(List<int> ids)=>getMovieRepo.getMoviesDetails(ids);

}
