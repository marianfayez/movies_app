import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/firebase_sign_up_request_model.dart';
import 'package:movies_app/features/auth/domain/use_cases/log_in_use_case.dart';
import 'package:movies_app/features/auth/domain/use_cases/sign_up_use_cases.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignUpUseCases signUpUseCases;
  LogInUseCase logInUseCase;

  AuthBloc(this.signUpUseCases, this.logInUseCase) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));

      var result = await signUpUseCases.call(request: event.model);
      return result.fold((error) {
        print("error response");
        emit(state.copyWith(
            requestState: RequestState.error, routeFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            requestState: RequestState.success, authModel: data));
      });
    });
    on<LogInEvent>((event, emit) async {
      emit(state.copyWith(logInRequestState: RequestState.loading));

      var result = await logInUseCase.call(event.email, event.password);
      return result.fold((error) {
        print("error response");
        print(error);
        emit(state.copyWith(
            logInRequestState: RequestState.error, routeFailures: error));
      }, (data) {
        print("Success response");
        emit(state.copyWith(
            logInRequestState: RequestState.success,
            authModel: data,
            isLoggedIn: true));
      });
    });
    on<LogInWithGoogleEvent>((event, emit) async {
      emit(state.copyWith(logInRequestState: RequestState.loading));

      final result = await logInUseCase.loginWithGoogle();

      result.fold(
        (error) {
          emit(state.copyWith(
            logInRequestState: RequestState.error,
            routeFailures: error,
          ));
        },
        (data) {
          emit(state.copyWith(
            logInRequestState: RequestState.success,
            authModel: data,
          ));
        },
      );
    });
    on<ForgetPasswordEvent>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));

      final result = await logInUseCase.forgetPassword(event.email);

      result.fold(
        (error) {
          emit(state.copyWith(
            requestState: RequestState.error,
            routeFailures: error,
          ));
        },
        (_) {
          emit(state.copyWith(
            requestState: RequestState.success,
          ));
        },
      );
    });
    on<CheckAuthStatusEvent>((event, emit) async {
      final loggedIn = await logInUseCase.checkAuthStatus();
      emit(state.copyWith(isLoggedIn: loggedIn));
    });
    on<LogOut>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));

      final result = await logInUseCase.logOut();

      result.fold(
        (error) {
          emit(state.copyWith(
            requestState: RequestState.error,
            routeFailures: error,
          ));
        },
        (_) {
          emit(state.copyWith(
            requestState: RequestState.success,
          ));
        },
      );
    });
  }
}
