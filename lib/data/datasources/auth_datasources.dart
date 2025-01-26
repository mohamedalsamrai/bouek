import 'package:bouek/app/services/auth_services.dart';

abstract class AuthDatasources {
  Future<void> loginUser({required String email, required String password});
  Future<void> registerUser(String email, String password);
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
}

class AuthDatasourcesImpl extends AuthDatasources {
  final AuthServices authServices;
  AuthDatasourcesImpl(this.authServices);
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
