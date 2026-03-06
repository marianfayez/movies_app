import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/history_screen/domain/use_cases/add_to_history_use_case.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/home_tab/presentation/bloc/get_movies_bloc.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/movie_details_use_cases.dart';
import 'package:movies_app/features/profile_tab/domain/use_cases/get_movie_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AddToHistoryUseCase addToHistoryUseCase;
  final GetMoviesBloc getMoviesBloc;
  GetMovieUseCase getMovieUseCase;

  ProfileBloc(
      this.addToHistoryUseCase, this.getMoviesBloc, this.getMovieUseCase)
      : super(ProfileInitial()) {
    on<GetHistoryEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      // final allMovies = getMoviesBloc.state.poplarMovieModel?.results;
      // if (allMovies == null) {
      //   print("Movies not loaded yet");
      //   return;
      // }
      emit(state.copyWith(getHistoryRequestState: RequestState.loading));
      var result = await addToHistoryUseCase.getHistory(userId);
      return result.fold(
        (error) {
          print("error response");
          emit(state.copyWith(
              getHistoryRequestState: RequestState.error,
              getHistoryRouteFailures: error));
        },
        (data) async {
          final moviesResult = await getMovieUseCase.getMoviesDetails(data);
          moviesResult.fold((error) {}, (movies) {
            print("Success response");
            emit(state.copyWith(
                getHistoryRequestState: RequestState.success, history: movies));
          });
        },
      );
    });
  }
}
