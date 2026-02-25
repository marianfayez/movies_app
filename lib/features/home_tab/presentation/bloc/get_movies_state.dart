part of 'get_movies_bloc.dart';


enum RequestState { init, loading, error, success }

class GetMoviesState {

  RequestState requestState;
  RouteFailures? routeFailures;
  PoplarMovieModel? poplarMovieModel;

  GetMoviesState(
      {this.routeFailures, this.requestState=RequestState.init, this.poplarMovieModel});

  GetMoviesState copyWith({
    RequestState? requestState,
    RouteFailures? routeFailures,
    PoplarMovieModel? poplarMovieModel
  }) {
    return GetMoviesState(requestState: requestState ?? this.requestState,
        routeFailures: routeFailures ?? this.routeFailures,
        poplarMovieModel: poplarMovieModel ?? this.poplarMovieModel);
  }
}

final class GetMoviesInitial extends GetMoviesState {
  GetMoviesInitial() :super(
      requestState: RequestState.init);
}
