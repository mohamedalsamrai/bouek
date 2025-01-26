import 'package:bouek/app/services/auth_services.dart';
import 'package:bouek/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthServices authServices;

  AuthRepositoryImpl(this.authServices);

  @override
  Future<void> loginUser(
      {required String email, required String password}) async {
    await authServices.loginUser(email: email, password: password);
  }

  @override
  Future<bool> isEmailVerified() async {
    return await authServices.isEmailVerified();
  }

  @override
  Future<void> registerUser(String email, String password) async {
    await authServices.registerUser(email, password);
  }

  @override
  Future<void> sendEmailVerification() async {
    await authServices.sendEmailVerification();
  }
}
