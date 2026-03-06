import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/history_screen/domain/use_cases/add_to_history_use_case.dart';
import 'package:movies_app/features/history_screen/domain/use_cases/toggle_favorite_use_case.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_cast_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_screen_shot_model.dart';
import 'package:movies_app/features/movie_details/data/models/similar_movie_model.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/movie_details_use_cases.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final MoviesDetailsUseCase moviesDetailsUseCase;
  final AddToHistoryUseCase addToHistoryUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  MovieDetailsBloc(this.moviesDetailsUseCase, this.addToHistoryUseCase,
      this.toggleFavoriteUseCase)
      : super(MoviesDetailsInitial()) {
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
    on<GetMovieCastEvent>((event, emit) async {
      emit(state.copyWith(movieCastRequestState: RequestState.loading));
      var result = await moviesDetailsUseCase.getMovieCast(event.movieId);
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            movieCastRequestState: RequestState.error,
            movieCastRouteFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            movieCastRequestState: RequestState.success, movieCastModel: data));
      });
    });

    on<AddToHistoryEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId == null) return;


      var result = await addToHistoryUseCase(userId, event.movieId);

      result.fold(
        (error) => print("add history error"),
        (_) => print("movie added to history"),
      );
    });
    on<ToggleFavoriteEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId == null) return;
      final newValue = !state.isFavorite;
      emit(state.copyWith(isFavorite: newValue));

      var result =
          await toggleFavoriteUseCase(userId, event.movieId, state.isFavorite);

      result.fold(
        (error) {
          emit(state.copyWith(
              isFavorite: !newValue,
              addToFavoriteRouteFailures: error));
        },
        (_) => print("favorite updated"),
      );
    });
  }
}
