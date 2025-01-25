import 'package:bouek/domain/repositories/auth_repository.dart';

class SendEmailVerification {
  final AuthRepository authRepository;

  SendEmailVerification(this.authRepository);

  Future<void> execute() {
    return authRepository.sendEmailVerification();
  }
}
