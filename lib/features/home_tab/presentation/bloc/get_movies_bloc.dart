import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/domain/use_cases/get_movies_use_case.dart';

part 'get_movies_event.dart';

part 'get_movies_state.dart';

@injectable
class GetMoviesBloc extends Bloc<MoviesEvent, GetMoviesState> {
  GetMoviesUseCase getMoviesUseCase;

  GetMoviesBloc(this.getMoviesUseCase) : super(GetMoviesInitial()) {
    on<GetMoviesEvent>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));
      var result = await getMoviesUseCase.call();
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            requestState: RequestState.error, routeFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            requestState: RequestState.success, poplarMovieModel: data));
      });
    });
  }
}
