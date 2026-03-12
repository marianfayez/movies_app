part of 'explore_bloc.dart';

class ExploreState {
  RequestState? exploreRequestState;
  RouteFailures? exploreRouteFailures;
  ExploreListModel? exploreListModel;

  RequestState? exploreMovieRequestState;
  RouteFailures? exploreMovieRouteFailures;
  ExploreMoviesModel? exploreMoviesModel;

  ExploreState({
    this.exploreListModel,
    this.exploreMovieRequestState,
    this.exploreMovieRouteFailures,
    this.exploreMoviesModel,
    this.exploreRequestState,
    this.exploreRouteFailures,
  });

  ExploreState copyWith({
    RequestState? exploreRequestState,
    RouteFailures? exploreRouteFailures,
    ExploreListModel? exploreListModel,
    RequestState? exploreMovieRequestState,
    RouteFailures? exploreMovieRouteFailures,
    ExploreMoviesModel? exploreMoviesModel,
  }) {
    return ExploreState(
      exploreRouteFailures: exploreRouteFailures ?? this.exploreRouteFailures,
      exploreRequestState: exploreRequestState ?? this.exploreRequestState,
      exploreListModel: exploreListModel ?? this.exploreListModel,
      exploreMovieRouteFailures: exploreMovieRouteFailures ?? this.exploreMovieRouteFailures,
      exploreMovieRequestState: exploreMovieRequestState ?? this.exploreMovieRequestState,
      exploreMoviesModel: exploreMoviesModel ?? this.exploreMoviesModel,
    );
  }
}

final class ExploreInitial extends ExploreState {
  ExploreInitial() : super(exploreRequestState: RequestState.init);
}
