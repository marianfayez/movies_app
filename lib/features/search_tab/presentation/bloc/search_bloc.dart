import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/search_tab/domain/use_cases/search_use_case.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';

part 'search_state.dart';

@injectable
class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchState> {
  SearchUseCase searchUseCase;

  SearchMovieBloc(this.searchUseCase) : super(SearchInitial()) {
    on<GetMovieByNameEvent>(
      _getMovieByName,
      transformer: _debounce(const Duration(milliseconds: 400)),
    );
  }

  EventTransformer<T> _debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
  }

  Future<void> _getMovieByName(
      GetMovieByNameEvent event, Emitter<SearchState> emit) async {
    if (event.name.length < 3) {
      emit(state.copyWith(
        searchMovieRequestState: RequestState.init,
        poplarMovieModel: PoplarMovieModel(results: []),
      ));
      return;
    }
    emit(state.copyWith(searchMovieRequestState: RequestState.loading));
    var result = await searchUseCase.getSearchMovie(event.name);
    return result.fold((error) {
      print("error response");
      emit(state.copyWith(
          searchMovieRequestState: RequestState.error,
          searchMovieRouteFailures: error));
    }, (data) {
      print("Success response");
      emit(state.copyWith(
          searchMovieRequestState: RequestState.success,
          poplarMovieModel: data));
    });
  }
}
