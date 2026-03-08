part of 'explore_bloc.dart';


class ExploreState {
  RequestState? exploreRequestState;
  RouteFailures? exploreRouteFailures;
  ExploreListModel? exploreListModel;

  ExploreState(
      {this.exploreListModel,
        this.exploreRequestState,
        this.exploreRouteFailures,
       });

  ExploreState copyWith(
      {RequestState? exploreRequestState,
        RouteFailures? exploreRouteFailures,

        ExploreListModel? exploreListModel,
       }) {
    return ExploreState(
        exploreRouteFailures: exploreRouteFailures ?? this.exploreRouteFailures,
        exploreRequestState: exploreRequestState ?? this.exploreRequestState,
        exploreListModel: exploreListModel??this.exploreListModel,
       );
  }
}

final class ExploreInitial extends ExploreState {
  ExploreInitial() : super(exploreRequestState: RequestState.init);
}
