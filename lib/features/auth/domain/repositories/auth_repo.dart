import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/firebase_sign_up_request_model.dart';

abstract class AuthRepo{

 Future<Either<RouteFailures,FirebaseAuthModel>>signUp({required FirebaseSignUpRequestModel request});
 Future<Either<RouteFailures,FirebaseAuthModel>>logIn({required String email,required String password});
 Future<Either<RouteFailures, FirebaseAuthModel>> logInWithGoogle();

}