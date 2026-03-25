import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/core/resources/request_state.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/firebase_user_remote_ds.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:movies_app/features/home_tab/data/models/movie_model.dart';
import 'package:movies_app/features/home_tab/data/models/poplar_movie_model.dart';
import 'package:movies_app/features/profile_tab/domain/use_cases/favorite_use_cases.dart';
import 'package:movies_app/features/profile_tab/domain/use_cases/get_movie_use_case.dart';
import 'package:movies_app/features/profile_tab/domain/use_cases/get_history_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  HistoryUseCase historyUseCase;
  GetMovieUseCase getMovieUseCase;
  FavoriteUseCases favoriteUseCases;
  FirebaseUserRemoteDS firebaseUserRemoteDS;

  ProfileBloc(this.historyUseCase, this.getMovieUseCase, this.favoriteUseCases,
      this.firebaseUserRemoteDS)
      : super(ProfileInitial()) {
    on<GetHistoryEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      emit(state.copyWith(getHistoryRequestState: RequestState.loading));
      var result = await historyUseCase.getHistory(userId);
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

    on<AddToHistoryEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return;
      var result = await historyUseCase(userId, event.movieId);
      result.fold(
        (error) => print("add history error"),
        (_) => print("movie added to history"),
      );
    });
    on<ToggleFavoriteEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return;
      final newValue = !event.isFavorite;

      emit(state.copyWith(isFavorite: newValue));
      var result =
          await favoriteUseCases(userId, event.movieId, event.isFavorite);
      result.fold(
        (error) {
          emit(state.copyWith(
              isFavorite: event.isFavorite, addToFavoriteRouteFailures: error));
        },
        (_) => print("favorite updated"),
      );
    });

    on<CheckFavoriteEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final result = await favoriteUseCases.getFavorite(userId);

      result.fold(
        (error) {},
        (favorites) {
          final isFav = favorites.contains(event.movieId);
          emit(state.copyWith(isFavorite: isFav));
        },
      );
    });

    on<GetFavoriteEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      emit(state.copyWith(getFavoriteRequestState: RequestState.loading));
      var result = await favoriteUseCases.getFavorite(userId);
      return result.fold(
        (error) {
          print("error response");
          emit(state.copyWith(
              getFavoriteRequestState: RequestState.error,
              getFavoriteRouteFailures: error));
        },
        (data) async {
          final moviesResult = await getMovieUseCase.getMoviesDetails(data);
          moviesResult.fold((error) {}, (movies) {
            print("Success response");
            emit(state.copyWith(
                getFavoriteRequestState: RequestState.success,
                favorites: movies));
          });
        },
      );
    });
    on<UpdateUserEvent>((event, emit) async {
      emit(state.copyWith(updateProfileRequestState: RequestState.loading));

      try {
        await firebaseUserRemoteDS.updateUser(event.user);

        emit(state.copyWith(
          updateProfileRequestState: RequestState.success,
          firebaseUserModel: event.user,
        ));

        print("Success: User updated");
      } catch (e) {
        emit(state.copyWith(
          updateProfileRequestState: RequestState.error,
          updateProfileRouteFailures: RemoteFailures(e.toString()),
        ));
        print("Error updating user: $e");
      }
    });

    on<DeleteUserEvent>((event, emit) async {
      emit(state.copyWith(deleteRequestState: RequestState.loading));

      try {
        final user = FirebaseAuth.instance.currentUser;

        if (user == null) throw Exception("User not logged in");

        await firebaseUserRemoteDS.deleteUser(user.uid);

        await user.delete();

        emit(state.copyWith(deleteRequestState: RequestState.success));
      } catch (e) {
        emit(state.copyWith(
          deleteRequestState: RequestState.error,
          deleteRouteFailures: RemoteFailures(e.toString()),
        ));
      }
    });
  }
}
