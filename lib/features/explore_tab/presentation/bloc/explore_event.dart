part of 'explore_bloc.dart';

abstract class ExploreEvent {}

class GetExploreListEvent extends ExploreEvent {}
class GetExploreMovieEvent extends ExploreEvent {
  int sourceId;
  GetExploreMovieEvent(this.sourceId);

}
