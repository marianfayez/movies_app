import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/core/resources/endpoints.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/search_tab/data/data_sources/remote/search_remote_ds.dart';

@Injectable(as: SearchRemoteDs)
class SearchRemoteDsImpl implements SearchRemoteDs {
  ApiManager apiManager;

  SearchRemoteDsImpl(this.apiManager);

  @override
  Future<PoplarMovieModel> getSearchMovie(String name) async {
    try {
      final result = await apiManager.getData(
        endPoint: EndPoints.getMovieByName(name),
      );
      return PoplarMovieModel.fromJson(result.data);
    } on DioException catch (e) {
      throw RemoteFailures(e.message ?? "Server Error");
    }
  }
}
