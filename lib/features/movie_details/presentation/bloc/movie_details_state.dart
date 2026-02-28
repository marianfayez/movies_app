part of 'movie_details_bloc.dart';

enum RequestState { init, loading, error, success }

class MoviesDetailsState {
  RequestState moviesDetailsRequestState;
  RouteFailures? moviesDetailsRouteFailures;
  MovieDetailsModel? movieDetailsModel;

  MoviesDetailsState({
    this.moviesDetailsRouteFailures,
    this.moviesDetailsRequestState = RequestState.init,
    this.movieDetailsModel});

  MoviesDetailsState copyWith({RequestState? moviesDetailsRequestState,
    RouteFailures? moviesDetailsRouteFailures,
    MovieDetailsModel? movieDetailsModel,
  }) {
    return MoviesDetailsState(
      moviesDetailsRequestState: moviesDetailsRequestState ??
          this.moviesDetailsRequestState,
      moviesDetailsRouteFailures: moviesDetailsRouteFailures ??
          this.moviesDetailsRouteFailures,
      movieDetailsModel: movieDetailsModel ?? this.movieDetailsModel,

    );
  }
}

final class MoviesDetailsInitial extends MoviesDetailsState {
  MoviesDetailsInitial() : super(moviesDetailsRequestState: RequestState.init);
}
