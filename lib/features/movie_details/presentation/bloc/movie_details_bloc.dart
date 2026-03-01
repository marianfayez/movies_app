import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_screen_shot_model.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_model.dart';
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
            moviesDetailsRequestState: RequestState.error,
            moviesDetailsRouteFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            moviesDetailsRequestState: RequestState.success,
            movieDetailsModel: data));
      });
    });
    on<GetMovieScreenShotEvent>((event, emit) async {
      emit(state.copyWith(movieScreenShotRequestState: RequestState.loading));
      var result = await moviesDetailsUseCase.getMovieScreenShot(event.movieId);

      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            movieScreenShotRequestState: RequestState.error,
            movieScreenShotRouteFailures: error));
      }, (data) {
        print("Success response");
        final uniqueScreenshots = {
          for (var e in data.backdrops ?? []) e.filePath: e as MovieImage
        }.values.toList();

        final newData = MovieScreenShotModel(
          id: data.id,
          backdrops: uniqueScreenshots,
        );
        emit(state.copyWith(
          movieScreenShotRequestState: RequestState.success,
          movieScreenShotModel: newData,
        ));
      });
    });
    on<GetSimilarMoviesEvent>((event, emit) async {
      emit(state.copyWith(similarMoviesRequestState: RequestState.loading));
      var result = await moviesDetailsUseCase.getSimilarMovie(event.movieId);
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            similarMoviesRequestState: RequestState.error,
            similarMoviesRouteFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            similarMoviesRequestState: RequestState.success,
            similarMoviesModel: data));
      });
    });

  }
}
