import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';

abstract class AuthRepo{

 Future<Either<RouteFailures,AuthModel>>signUp({required SignUpRequestModel request});
 Future<Either<RouteFailures,AuthModel>>logIn({required String email,required String password});

}