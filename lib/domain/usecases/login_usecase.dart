import 'package:bouek/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;
  LoginUsecase(this.authRepository);

  Future<void> call({required String email, required String password}) async =>
      authRepository.loginUser(email: email, password: password);
}
