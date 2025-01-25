import 'package:bouek/domain/repositories/auth_repository.dart';

class CheckEmailVerification {
  final AuthRepository authRepository;

  CheckEmailVerification(this.authRepository);

  Future<bool> execute() async {
    return await authRepository.isEmailVerified();
  }
}