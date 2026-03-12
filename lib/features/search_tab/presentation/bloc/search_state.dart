part of 'search_bloc.dart';

enum RequestState { init, loading, error, success }

class SearchState {
  RequestState searchMovieRequestState;
  RouteFailures? searchMovieRouteFailures;
  PoplarMovieModel? poplarMovieModel;

  SearchState(
      {this.searchMovieRouteFailures,
        this.poplarMovieModel,
        this.searchMovieRequestState = RequestState.init,
        });

  SearchState copyWith({
    RequestState? searchMovieRequestState,
    RouteFailures? searchMovieRouteFailures,
    PoplarMovieModel? poplarMovieModel,
  }) {
    return SearchState(
      searchMovieRequestState:
      searchMovieRequestState ?? this.searchMovieRequestState,
      searchMovieRouteFailures:
      searchMovieRouteFailures ?? this.searchMovieRouteFailures,
      poplarMovieModel: poplarMovieModel ?? this.poplarMovieModel,

    );
  }
}

final class SearchInitial extends SearchState {
  SearchInitial() : super(searchMovieRequestState: RequestState.init);
}
