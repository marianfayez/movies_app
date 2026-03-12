part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent{
  FirebaseSignUpRequestModel model;
  SignUpEvent(this.model);
}
class LogInEvent extends AuthEvent{
  String email;
  String password;
  LogInEvent(this.email,this.password);
}
class LogInWithGoogleEvent extends AuthEvent {}
class ForgetPasswordEvent extends AuthEvent {
  final String email;
  ForgetPasswordEvent(this.email);
}
class CheckAuthStatusEvent extends AuthEvent {}

class LogOut extends AuthEvent {}
