import 'package:weight_tracker/Auth/domain/repository/base_auth_repository.dart';

class AuthUseCase {
  final BaseAuthRepository baseAuthRepository;
  AuthUseCase(this.baseAuthRepository);
  Future<void> signIn() async {
    return await (baseAuthRepository.signIn());
  }

  Future<void> signOut() async {
    return await (baseAuthRepository.signIn());
  }
}
