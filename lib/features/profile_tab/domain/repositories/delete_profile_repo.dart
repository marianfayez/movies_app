import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failuers/failuers.dart';

abstract class DeleteProfileRepo {
  Future<Either<RouteFailures, void>> deleteProfile(
    String userId,
  );
}
