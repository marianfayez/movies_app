part of 'movie_details_bloc.dart';

enum RequestState { init, loading, error, success }

class MoviesDetailsState {
  RequestState moviesDetailsRequestState;
  RouteFailures? moviesDetailsRouteFailures;
  MovieDetailsModel? movieDetailsModel;

  RequestState? movieScreenShotRequestState;
  RouteFailures? movieScreenShotRouteFailures;
  MovieScreenShotModel? movieScreenShotModel;

  RequestState? similarMoviesRequestState;
  RouteFailures? similarMoviesRouteFailures;
  SimilarMoviesModel? similarMoviesModel;

  MoviesDetailsState(
      {this.moviesDetailsRouteFailures,
      this.similarMoviesModel,
      this.similarMoviesRequestState,
      this.similarMoviesRouteFailures,
      this.movieScreenShotModel,
      this.movieScreenShotRequestState,
      this.movieScreenShotRouteFailures,
      this.moviesDetailsRequestState = RequestState.init,
      this.movieDetailsModel});

  MoviesDetailsState copyWith({
    RequestState? moviesDetailsRequestState,
    RouteFailures? moviesDetailsRouteFailures,
    MovieDetailsModel? movieDetailsModel,
    RequestState? similarMoviesRequestState,
    RouteFailures? similarMoviesRouteFailures,
    SimilarMoviesModel? similarMoviesModel,
    RequestState? movieScreenShotRequestState,
    RouteFailures? movieScreenShotRouteFailures,
    MovieScreenShotModel? movieScreenShotModel,
  }) {
    return MoviesDetailsState(
      moviesDetailsRequestState:
          moviesDetailsRequestState ?? this.moviesDetailsRequestState,
      moviesDetailsRouteFailures:
          moviesDetailsRouteFailures ?? this.moviesDetailsRouteFailures,
      movieDetailsModel: movieDetailsModel ?? this.movieDetailsModel,
     similarMoviesRequestState:
     similarMoviesRequestState ?? this.similarMoviesRequestState,
     similarMoviesRouteFailures:
     similarMoviesRouteFailures ?? this.similarMoviesRouteFailures,
      similarMoviesModel: similarMoviesModel ?? this.similarMoviesModel,
      movieScreenShotRequestState:
          movieScreenShotRequestState ?? this.movieScreenShotRequestState,
      movieScreenShotRouteFailures:
          movieScreenShotRouteFailures ?? this.movieScreenShotRouteFailures,
      movieScreenShotModel: movieScreenShotModel ?? this.movieScreenShotModel,
    );
  }
}

final class MoviesDetailsInitial extends MoviesDetailsState {
  MoviesDetailsInitial() : super(moviesDetailsRequestState: RequestState.init);
}
