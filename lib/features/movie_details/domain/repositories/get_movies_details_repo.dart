import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';

abstract class GetMoviesDetailsRepo{

  Future<Either<RouteFailures,MovieDetailsModel>>getMoviesDetails(String movieId);


}