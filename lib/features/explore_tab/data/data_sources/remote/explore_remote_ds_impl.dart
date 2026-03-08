

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/core/resources/endpoints.dart';
import 'package:movies_app/features/explore_tab/data/data_sources/remote/explore_remote_ds.dart';
import 'package:movies_app/features/explore_tab/data/models/explore_list_model.dart';

@Injectable(as: ExploreRemoteDs)
class ExploreRemoteDsImpl implements ExploreRemoteDs {
  ApiManager apiManager;

  ExploreRemoteDsImpl(this.apiManager);

  @override
  Future<ExploreListModel> getExploreList() async {
    try {
      final result = await apiManager.getData(endPoint: EndPoints.getBrowseList);
      return ExploreListModel.fromJson(result.data);
    } on DioException catch (e) {
      throw RemoteFailures(e.message ?? "Server Error");
    }
  }


}
