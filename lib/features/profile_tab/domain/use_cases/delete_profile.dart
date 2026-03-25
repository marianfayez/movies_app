import 'package:movies_app/features/auth/data/data_sources/remote/firebase_user_remote_ds.dart';

class DeleteUserUseCase {
  final FirebaseUserRemoteDS remoteDS;

  DeleteUserUseCase(this.remoteDS);

  Future<void> call(String userId) {
    return remoteDS.deleteUser(userId);
  }
}