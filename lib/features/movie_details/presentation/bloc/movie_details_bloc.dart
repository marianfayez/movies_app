import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/movie_details_use_cases.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsUseCase moviesDetailsUseCase;

  MovieDetailsBloc(this.moviesDetailsUseCase) : super(MoviesDetailsInitial()) {
    on<GetMoviesDetailsEvent>((event, emit) async {
      emit(state.copyWith(moviesDetailsRequestState: RequestState.loading));
      var result = await moviesDetailsUseCase.getMoviesDetails(event.movieId);
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            moviesDetailsRequestState: RequestState.error, moviesDetailsRouteFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            moviesDetailsRequestState: RequestState.success, movieDetailsModel: data));
      });
    });

  }
}
