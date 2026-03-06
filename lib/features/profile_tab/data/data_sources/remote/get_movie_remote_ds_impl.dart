import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/core/resources/endpoints.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_cast_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_screen_shot_model.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_model.dart';
import 'package:movies_app/features/profile_tab/data/data_sources/remote/get_movie_remote_ds.dart';

@Injectable(as: GetMovieRemoteDs)
class GetMovieRemoteDsImpl implements GetMovieRemoteDs {
  ApiManager apiManager;

  GetMovieRemoteDsImpl(this.apiManager);

  @override
  Future<MovieDetailsModel> getMoviesDetails(int movieId) async {
    try {
      final result = await apiManager.getData(
        endPoint: EndPoints.getMoviesDetails(movieId),
        queryParameters: {
          "language": "en-US",
          "page": 1,
        },
      );
      return MovieDetailsModel.fromJson(result.data);
    } on DioException catch (e) {
      throw RemoteFailures(e.message ?? "Server Error");
    }
  }

  @override
  Future<Results> getMoviesById(int movieId) async{
    try {
      final result = await apiManager.getData(
        endPoint: EndPoints.getMoviesDetails(movieId),

      );
      return Results.fromJson(result.data);
    } on DioException catch (e) {
      throw RemoteFailures(e.message ?? "Server Error");
    }
  }


}
