part of 'movie_details_bloc.dart';

abstract class MoviesDetailsEvent {}

class GetMoviesDetailsEvent extends MoviesDetailsEvent {
  int movieId;
  GetMoviesDetailsEvent(this.movieId);
}
class GetMovieScreenShotEvent extends MoviesDetailsEvent {
  int movieId;
  GetMovieScreenShotEvent(this.movieId);
}
class GetSimilarMoviesEvent extends MoviesDetailsEvent {
  int movieId;
  GetSimilarMoviesEvent(this.movieId);
}
class GetMovieCastEvent extends MoviesDetailsEvent {
  int movieId;
  GetMovieCastEvent(this.movieId);
}
