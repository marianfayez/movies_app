import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/explore_tab/data/data_sources/remote/explore_remote_ds.dart';
import 'package:movies_app/features/explore_tab/data/models/explore_list_model.dart';
import 'package:movies_app/features/explore_tab/domain/repositories/explore_repo.dart';

@Injectable(as: ExploreRepo)
class ExploreRepoImpl implements ExploreRepo {
  ExploreRemoteDs exploreRemoteDs;

  ExploreRepoImpl(this.exploreRemoteDs);

  @override
  Future<Either<RouteFailures, ExploreListModel>> getExploreList() async {
    try {
      var result = await exploreRemoteDs.getExploreList();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
