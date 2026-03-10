part of 'auth_bloc.dart';


 class AuthState {

FirebaseAuthModel? authModel;
RequestState? requestState;
RequestState? logInRequestState;
RequestState? forgetPasswordRequestState;
 bool? isLoggedIn;
RouteFailures? routeFailures;

AuthState({this.routeFailures,this.isLoggedIn,this.requestState,this.logInRequestState,this.authModel,this.forgetPasswordRequestState});

AuthState copyWith({FirebaseAuthModel? authModel,
RequestState? requestState,
RouteFailures? routeFailures,
  RequestState? logInRequestState,
  bool? isLoggedIn,
  RequestState? forgetPasswordRequestState
}){

  return AuthState(requestState: requestState ?? this.requestState,
      logInRequestState: logInRequestState ?? this.logInRequestState,
      forgetPasswordRequestState: forgetPasswordRequestState ?? this.forgetPasswordRequestState,
      routeFailures: routeFailures ?? this.routeFailures,
   isLoggedIn: isLoggedIn??this.isLoggedIn,
  authModel: authModel ?? this.authModel);
}
 }

final class AuthInitial extends AuthState {
  AuthInitial():super(requestState: RequestState.init,logInRequestState: RequestState.init);
}
