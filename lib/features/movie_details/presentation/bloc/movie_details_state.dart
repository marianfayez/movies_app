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

  RequestState? movieCastRequestState;
  RouteFailures? movieCastRouteFailures;
  MovieCastModel? movieCastModel;

  MoviesDetailsState(
      {this.moviesDetailsRouteFailures,
      this.similarMoviesModel,
      this.similarMoviesRequestState,
      this.movieCastModel,
      this.movieCastRequestState,
      this.movieCastRouteFailures,
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
    RequestState? movieCastRequestState,
    RouteFailures? movieCastRouteFailures,
    MovieCastModel? movieCastModel,
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
      movieCastRequestState:
          movieCastRequestState ?? this.movieCastRequestState,
      movieCastRouteFailures:
          movieCastRouteFailures ?? this.movieCastRouteFailures,
      movieCastModel: movieCastModel ?? this.movieCastModel,
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
