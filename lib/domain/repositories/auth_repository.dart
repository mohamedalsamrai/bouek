abstract class AuthRepository {
  Future<void> registerUser(String email, String password);
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
}