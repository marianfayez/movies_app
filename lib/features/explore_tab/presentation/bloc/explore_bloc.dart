import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/resources/request_state.dart';
import 'package:movies_app/features/explore_tab/data/models/explore_list_model.dart';
import 'package:movies_app/features/explore_tab/domain/use_cases/explore_use_case.dart';

part 'explore_event.dart';

part 'explore_state.dart';

@injectable
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreUseCase exploreUseCase;

  ExploreBloc(this.exploreUseCase) : super(ExploreInitial()) {
    on<GetExploreListEvent>((event, emit) async {
      emit(state.copyWith(exploreRequestState: RequestState.loading));
      var result = await exploreUseCase.call();
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            exploreRequestState: RequestState.error,
            exploreRouteFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            exploreRequestState: RequestState.success, exploreListModel: data));
      });
    });
  }
}
