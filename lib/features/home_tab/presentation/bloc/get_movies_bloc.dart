import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/data/models/upcoming_movies.dart';
import 'package:movies_app/features/home_tab/domain/use_cases/get_movies_use_case.dart';

import '../../../../core/resources/request_state.dart';

part 'get_movies_event.dart';

part 'get_movies_state.dart';

@injectable
class GetMoviesBloc extends Bloc<MoviesEvent, GetMoviesState> {
  GetMoviesUseCase getMoviesUseCase;

  GetMoviesBloc(this.getMoviesUseCase) : super(GetMoviesInitial()) {
    on<GetMoviesEvent>((event, emit) async {
      emit(state.copyWith(getMoviesRequestState: RequestState.loading));
      var result = await getMoviesUseCase.call();
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            getMoviesRequestState: RequestState.error, getMoviesRouteFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            getMoviesRequestState: RequestState.success, poplarMovieModel: data));
      });
    });
    on<GetUpcomingMoviesEvent>((event, emit) async {
      emit(state.copyWith(getUpcomingMoviesRequestState: RequestState.loading));
      var result = await getMoviesUseCase.getUpcomingMovies();
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            getUpcomingMoviesRequestState: RequestState.error, getUpcomingMoviesRouteFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            getUpcomingMoviesRequestState: RequestState.success, upcomingMoviesModel: data));
      });
    });

  }
}
