part of 'search_bloc.dart';

abstract class SearchMovieEvent {}

class GetMovieByNameEvent extends SearchMovieEvent {
  String name;
  GetMovieByNameEvent(this.name);
}
