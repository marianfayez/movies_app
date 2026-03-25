import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failuers/failuers.dart';
import 'package:movies_app/core/failuers/remote_failuers.dart';
import 'package:movies_app/features/auth/data/data_sources/remote/firebase_user_remote_ds.dart';
import 'package:movies_app/features/profile_tab/domain/repositories/delete_profile_repo.dart';

@Injectable(as: DeleteProfileRepo)
class DeleteProfileRepoImpl implements DeleteProfileRepo {
  FirebaseUserRemoteDS firebaseUserRemoteDS;

  DeleteProfileRepoImpl(this.firebaseUserRemoteDS);

  @override
  Future<Either<RouteFailures, void>> deleteProfile(String userId) async {
    try {
      var result = await firebaseUserRemoteDS.deleteUser(userId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
