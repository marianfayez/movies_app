import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repo.dart';

@injectable
class LogInUseCase {

  AuthRepo authRepo;

  LogInUseCase(this.authRepo);

  Future<Either<RouteFailures,FirebaseAuthModel>>call(String email,String password)=>authRepo.logIn(email: email, password: password);
}