import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/explore_tab/data/models/explore_list_model.dart';
import 'package:movies_app/features/explore_tab/domain/repositories/explore_repo.dart';

@injectable
class ExploreUseCase {
  ExploreRepo exploreRepo;

  ExploreUseCase(this.exploreRepo);

  Future<Either<RouteFailures, ExploreListModel>> call() =>
      exploreRepo.getExploreList();
}
