part of 'profile_bloc.dart';

class ProfileState {
  RequestState? getHistoryRequestState;
  RouteFailures? getHistoryRouteFailures;
  RequestState? getFavoriteRequestState;
  RouteFailures? getFavoriteRouteFailures;

  List<MovieModel>? history = [];
  List<MovieModel>? favorites = [];
  RequestState? addToFavoriteRequestState;
  RouteFailures? addToFavoriteRouteFailures;
  PoplarMovieModel? poplarMovieModel;

  RequestState? addToHistoryRequestState;
  RouteFailures? addToHistoryRouteFailures;

  RequestState? deleteRequestState;
  RouteFailures? deleteRouteFailures;

  RequestState? updateProfileRequestState;
  RouteFailures? updateProfileRouteFailures;
  FirebaseAuthModel? firebaseAuthModel;
  FirebaseUserModel? firebaseUserModel;
  bool isFavorite = false;

  ProfileState(
      {this.getHistoryRequestState,
      this.history,
      this.deleteRequestState,
      this.deleteRouteFailures,
      this.isFavorite = false,
      this.poplarMovieModel,
      this.firebaseUserModel,
      this.getFavoriteRouteFailures,
      this.addToHistoryRequestState,
      this.firebaseAuthModel,
      this.updateProfileRequestState,
      this.updateProfileRouteFailures,
      this.addToHistoryRouteFailures,
      this.addToFavoriteRequestState,
      this.addToFavoriteRouteFailures,
      this.getHistoryRouteFailures,
      this.favorites,
      this.getFavoriteRequestState});

  ProfileState copyWith(
      {bool? isFavorite,
      RequestState? addToFavoriteRequestState,
      RouteFailures? addToFavoriteRouteFailures,
      RequestState? deleteRequestState,
      RouteFailures? deleteRouteFailures,
      RequestState? addToHistoryRequestState,
      RouteFailures? addToHistoryRouteFailures,
      PoplarMovieModel? poplarMovieModel,
      RequestState? updateProfileRequestState,
      RouteFailures? updateProfileRouteFailures,
      FirebaseAuthModel? firebaseAuthModel,
      FirebaseUserModel? firebaseUserModel,
      RequestState? getHistoryRequestState,
      RouteFailures? getHistoryRouteFailures,
      RouteFailures? getFavoriteRouteFailures,
      List<MovieModel>? history,
      List<MovieModel>? favorites,
      RequestState? getFavoriteRequestState}) {
    return ProfileState(
      addToHistoryRequestState:
          addToHistoryRequestState ?? this.addToHistoryRequestState,
      addToHistoryRouteFailures:
          addToHistoryRouteFailures ?? this.addToHistoryRouteFailures,
      deleteRequestState: deleteRequestState ?? this.deleteRequestState,
      deleteRouteFailures: deleteRouteFailures ?? this.deleteRouteFailures,
      addToFavoriteRequestState:
          addToFavoriteRequestState ?? this.addToFavoriteRequestState,
      addToFavoriteRouteFailures:
          addToFavoriteRouteFailures ?? this.addToFavoriteRouteFailures,
      updateProfileRequestState:
          updateProfileRequestState ?? this.updateProfileRequestState,
      updateProfileRouteFailures:
          updateProfileRouteFailures ?? this.updateProfileRouteFailures,
      firebaseAuthModel: firebaseAuthModel ?? this.firebaseAuthModel,
      firebaseUserModel: firebaseUserModel ?? this.firebaseUserModel,
      poplarMovieModel: poplarMovieModel ?? this.poplarMovieModel,
      isFavorite: isFavorite ?? this.isFavorite,
      history: history ?? this.history,
      favorites: favorites ?? this.favorites,
      getFavoriteRequestState:
          getFavoriteRequestState ?? this.getFavoriteRequestState,
      getFavoriteRouteFailures:
          getFavoriteRouteFailures ?? this.getFavoriteRouteFailures,
      getHistoryRouteFailures:
          getHistoryRouteFailures ?? this.getHistoryRouteFailures,
      getHistoryRequestState:
          getHistoryRequestState ?? this.getHistoryRequestState,
    );
  }
}

final class ProfileInitial extends ProfileState {
  ProfileInitial() : super(getHistoryRequestState: RequestState.init);
}
