import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/core/resources/endpoints.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/data/models/upcoming_movies.dart';
import 'package:movies_app/features/movie_details/data/data_sources/remote/get_movies_details_remote_ds.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';

@Injectable(as: GetMoviesDetailsRemoteDs)
class GetMoviesRemoteDsImpl implements GetMoviesDetailsRemoteDs {
  ApiManager apiManager;

  GetMoviesRemoteDsImpl(this.apiManager);

  @override
  Future<MovieDetailsModel> getMoviesDetails(String movieId) async {
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
}
