import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/domain/repositories/get_movies_details_repo.dart';

@injectable
class MoviesDetailsUseCase {
  GetMoviesDetailsRepo getMoviesDetailsRepo;

  MoviesDetailsUseCase(this.getMoviesDetailsRepo);

  Future<Either<RouteFailures, MovieDetailsModel>> getMoviesDetails(String movieId)=>getMoviesDetailsRepo.getMoviesDetails(movieId);

}
