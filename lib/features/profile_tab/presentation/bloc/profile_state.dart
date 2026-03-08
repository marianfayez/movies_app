part of 'profile_bloc.dart';


class ProfileState {
  RequestState? getHistoryRequestState;
  RouteFailures? getHistoryRouteFailures;
  RequestState? getFavoriteRequestState;
  List<Results>? history = [];
  List<Results>? favorites =[];
  RequestState? addToFavoriteRequestState;
  RouteFailures? addToFavoriteRouteFailures;
  PoplarMovieModel? poplarMovieModel;

  RequestState? addToHistoryRequestState;
  RouteFailures? addToHistoryRouteFailures;

  bool isFavorite = false;
  ProfileState(
      {this.getHistoryRequestState,
        this.history,
        this.isFavorite = false,
        this.poplarMovieModel,
        this.addToHistoryRequestState,
        this.addToHistoryRouteFailures,
        this.addToFavoriteRequestState,
        this.addToFavoriteRouteFailures,
        this.getHistoryRouteFailures,
        this.favorites,this.getFavoriteRequestState
        });

  ProfileState copyWith(
      {bool? isFavorite,
        RequestState? addToFavoriteRequestState,
        RouteFailures? addToFavoriteRouteFailures,
        RequestState? addToHistoryRequestState,
        RouteFailures? addToHistoryRouteFailures,
        PoplarMovieModel? poplarMovieModel,
        RequestState? getHistoryRequestState,
        RouteFailures? getHistoryRouteFailures,
        List<Results>? history,
        List<Results>? favorites,
        RequestState? getFavoriteRequestState

      }) {
    return ProfileState(
      addToHistoryRequestState:
      addToHistoryRequestState ?? this.addToHistoryRequestState,
      addToHistoryRouteFailures:
      addToHistoryRouteFailures ?? this.addToHistoryRouteFailures,
      addToFavoriteRequestState:
      addToFavoriteRequestState ?? this.addToFavoriteRequestState,
      addToFavoriteRouteFailures:
      addToFavoriteRouteFailures ?? this.addToFavoriteRouteFailures,
      poplarMovieModel: poplarMovieModel ?? this.poplarMovieModel,
      isFavorite: isFavorite ?? this.isFavorite,
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
