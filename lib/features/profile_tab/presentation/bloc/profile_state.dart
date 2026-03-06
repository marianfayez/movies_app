part of 'profile_bloc.dart';

enum RequestState { init, loading, error, success }

class ProfileState {
  RequestState? getHistoryRequestState;
  RouteFailures? getHistoryRouteFailures;
  RequestState? getFavoriteRequestState;
  List<Results>? history = [];
  List<Results>? favorites =[];

  ProfileState(
      {this.getHistoryRequestState,
        this.history,
        this.getHistoryRouteFailures,
        this.favorites,this.getFavoriteRequestState
        });

  ProfileState copyWith(
      {RequestState? getHistoryRequestState,
        RouteFailures? getHistoryRouteFailures,
        List<Results>? history,
        List<Results>? favorites,
        RequestState? getFavoriteRequestState

      }) {
    return ProfileState(
      history: history??this.history,
      favorites: favorites ?? this.favorites,
      getFavoriteRequestState: getFavoriteRequestState ?? this.getFavoriteRequestState,
      getHistoryRouteFailures: getHistoryRouteFailures ?? this.getHistoryRouteFailures,
        getHistoryRequestState: getHistoryRequestState ?? this.getHistoryRequestState,
    );
  }
}

final class ProfileInitial extends ProfileState {
  ProfileInitial() : super(getHistoryRequestState: RequestState.init);
}
