import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/history_screen/domain/use_cases/add_to_history_use_case.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/presentation/bloc/get_movies_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AddToHistoryUseCase addToHistoryUseCase;
  final GetMoviesBloc getMoviesBloc;
  StreamSubscription? moviesSubscription;

  ProfileBloc(this.addToHistoryUseCase, this.getMoviesBloc)
      : super(ProfileInitial()) {
    moviesSubscription = getMoviesBloc.stream.listen((moviesState) {
      final popularMovies = moviesState.poplarMovieModel?.results;
      if (popularMovies != null && popularMovies.isNotEmpty) {
        add(GetHistoryEvent());
      }
    });
    on<GetHistoryEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final allMovies = getMoviesBloc.state.poplarMovieModel?.results;
      if (allMovies == null || allMovies.isEmpty) {
        print("Popular movies not loaded yet, waiting...");

        return;
      }
      emit(state.copyWith(getHistoryRequestState: RequestState.loading));
      var result = await addToHistoryUseCase.getHistory(userId);
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            getHistoryRequestState: RequestState.error,
            getHistoryRouteFailures: error));
      }, (data) {
        final historyMovies =
            allMovies.where((movie) => data.contains(movie.id??0)).toList();

        print("Success response");
        emit(state.copyWith(
            getHistoryRequestState: RequestState.success,
            history: historyMovies));
      });
    });
  }
  @override
  Future<void> close() {
    moviesSubscription?.cancel();
    return super.close();
  }
}
