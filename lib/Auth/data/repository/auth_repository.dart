import 'package:weight_tracker/Auth/data/datasource/auth_remote_datasource.dart';
import 'package:weight_tracker/Auth/domain/repository/base_auth_repository.dart';

class AuthRepository implements BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  AuthRepository(this.baseAuthRemoteDataSource);
  @override
  Future<void> signIn() async {
    await baseAuthRemoteDataSource.signIn();
  }

  @override
  Future<void> signOut() async {
    await baseAuthRemoteDataSource.signOut();
  }
}
