import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/core/resources/endpoints.dart';
import 'package:movies_app/features/home_tab/data/data_sources/remote/get_movies_remote_ds.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/data/models/upcoming_movies.dart';

@Injectable(as: GetMoviesRemoteDs)
class GetMoviesRemoteDsImpl implements GetMoviesRemoteDs {
  ApiManager apiManager;

  GetMoviesRemoteDsImpl(this.apiManager);

  @override
  Future<PoplarMovieModel> getMovies() async {
    try {
      final result = await apiManager.getData(endPoint: EndPoints.getMovies);
      return PoplarMovieModel.fromJson(result.data);
    } on DioException catch (e) {
      throw RemoteFailures(e.message ?? "Server Error");
    }
  }

  @override
  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    try {
      final result = await apiManager.getData(
        endPoint: EndPoints.getupComingMovies,
        queryParameters: {
          "language": "en-US",
          "page": 1,
        },
      );
      return UpcomingMoviesModel.fromJson(result.data);
    } on DioException catch (e) {
      throw RemoteFailures(e.message ?? "Server Error");
    }
  }
}
