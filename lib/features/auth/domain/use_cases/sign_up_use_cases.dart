import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/firebase_sign_up_request_model.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repo.dart';

@injectable
class SignUpUseCases {
  AuthRepo authRepo;

  SignUpUseCases(this.authRepo);

  Future<Either<RouteFailures, FirebaseAuthModel>> call(
      {required FirebaseSignUpRequestModel request}) {
    return authRepo.signUp(request: request);
  }
}
