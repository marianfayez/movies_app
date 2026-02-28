part of 'movie_details_bloc.dart';

abstract class MoviesDetailsEvent {}

class GetMoviesDetailsEvent extends MoviesDetailsEvent {
  String movieId;
  GetMoviesDetailsEvent(this.movieId);
}
