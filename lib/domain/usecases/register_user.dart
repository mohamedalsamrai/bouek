import 'package:bouek/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository authRepository;

  RegisterUser(this.authRepository);

  Future<void> execute(String email, String password) {
    return authRepository.registerUser(email, password);
  }
}
