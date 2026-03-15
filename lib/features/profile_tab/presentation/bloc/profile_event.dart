part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetHistoryEvent extends ProfileEvent {}

class CheckFavoriteEvent extends ProfileEvent {
  final int movieId;

  CheckFavoriteEvent(this.movieId);
}

class GetFavoriteEvent extends ProfileEvent {}

class ToggleFavoriteEvent extends ProfileEvent {
  final int movieId;
  final bool isFavorite;

  ToggleFavoriteEvent(this.movieId, this.isFavorite);
}

class AddToHistoryEvent extends ProfileEvent {
  final int movieId;

  AddToHistoryEvent(this.movieId);
}

class UpdateUserEvent extends ProfileEvent {
  final FirebaseUserModel user;

  UpdateUserEvent(this.user);
}
