part of 'get_movies_bloc.dart';

enum RequestState { init, loading, error, success }

class GetMoviesState {
  RequestState? getUpcomingMoviesRequestState;
  RouteFailures? getUpcomingMoviesRouteFailures;
  RequestState? getMoviesRequestState;
  RouteFailures? getMoviesRouteFailures;
  PoplarMovieModel? poplarMovieModel;
  UpcomingMoviesModel? upcomingMoviesModel;

  GetMoviesState(
      {this.getMoviesRouteFailures,
      this.getUpcomingMoviesRequestState,
      this.getUpcomingMoviesRouteFailures,
      this.upcomingMoviesModel,
      this.getMoviesRequestState = RequestState.init,
      this.poplarMovieModel});

  GetMoviesState copyWith(
      {RequestState? getMoviesRequestState,
      RouteFailures? getMoviesRouteFailures,
        RequestState? getUpcomingMoviesRequestState,
        RouteFailures? getUpcomingMoviesRouteFailures,
        UpcomingMoviesModel? upcomingMoviesModel,
      PoplarMovieModel? poplarMovieModel}) {
    return GetMoviesState(
      getUpcomingMoviesRequestState: getUpcomingMoviesRequestState ?? this.getUpcomingMoviesRequestState,
        getUpcomingMoviesRouteFailures: getUpcomingMoviesRouteFailures ?? this.getUpcomingMoviesRouteFailures,
        upcomingMoviesModel: upcomingMoviesModel??this.upcomingMoviesModel,
        getMoviesRequestState: getMoviesRequestState ?? this.getMoviesRequestState,
        getMoviesRouteFailures: getMoviesRouteFailures ?? this.getMoviesRouteFailures,
        poplarMovieModel: poplarMovieModel ?? this.poplarMovieModel);
  }
}

final class GetMoviesInitial extends GetMoviesState {
  GetMoviesInitial() : super(getMoviesRequestState: RequestState.init,getUpcomingMoviesRequestState: RequestState.init);
}
