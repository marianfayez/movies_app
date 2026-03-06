part of 'profile_bloc.dart';

enum RequestState { init, loading, error, success }

class ProfileState {
  RequestState? getHistoryRequestState;
  RouteFailures? getHistoryRouteFailures;
  List<Results>? history = [];
  Map<int, Results>? historyMoviesMap = {};

  ProfileState(
      {this.getHistoryRequestState,
        this.history,
        this.getHistoryRouteFailures,
        this.historyMoviesMap
        });

  ProfileState copyWith(
      {RequestState? getHistoryRequestState,
        RouteFailures? getHistoryRouteFailures,
        List<Results>? history,
        Map<int, Results>? historyMoviesMap,
      }) {
    return ProfileState(
      history: history??this.history,
      historyMoviesMap: historyMoviesMap ?? this.historyMoviesMap,
      getHistoryRouteFailures: getHistoryRouteFailures ?? this.getHistoryRouteFailures,
        getHistoryRequestState: getHistoryRequestState ?? this.getHistoryRequestState,
    );
  }
}

final class ProfileInitial extends ProfileState {
  ProfileInitial() : super(getHistoryRequestState: RequestState.init);
}
