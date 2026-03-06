part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetHistoryEvent extends ProfileEvent {}
class CheckFavoriteEvent extends ProfileEvent {
  final int movieId;
  CheckFavoriteEvent(this.movieId);
}

class ToggleFavoriteEvent extends ProfileEvent {
  final int movieId;
  final bool isFavorite;
  ToggleFavoriteEvent(this.movieId, this.isFavorite);
}
