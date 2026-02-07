import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/auth_remote_ds.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/firebase_sign_up_request_model.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{

  AuthRemoteDs authRemoteDs;
  AuthRepoImpl(this.authRemoteDs);

  @override
  Future<Either<RouteFailures, FirebaseAuthModel>> signUp( {required FirebaseSignUpRequestModel request}) async{
    try{
      var result = await authRemoteDs.signUp(request:request);
      return Right(result);
    }catch(e){
      return Left(RemoteFailures(e.toString()));
    }

  }

  @override
  Future<Either<RouteFailures, FirebaseAuthModel>> logIn({required String email, required String password}) async{
    try{
      var result = await authRemoteDs.logIn(email: email,password: password);
      return Right(result);
    }catch(e){
      return Left(RemoteFailures(e.toString()));
    }

  }

  @override
  Future<Either<RouteFailures, FirebaseAuthModel>> logInWithGoogle() async {
    try {
      final result = await authRemoteDs.logInWithGoogle();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}