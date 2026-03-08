import 'package:movies_app/features/explore_tab/data/models/explore_list_model.dart';

abstract class ExploreRemoteDs {
  Future<ExploreListModel> getExploreList();
}
