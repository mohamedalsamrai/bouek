import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth auth;
  AuthServices({required this.auth});

  // Endpoints
  Future<void> loginUser({required String email, required String password}) =>
      auth.signInWithEmailAndPassword(email: email, password: password);

  Future<void> registerUser(String email, String password) =>
      auth.createUserWithEmailAndPassword(email: email, password: password);

  Future<void> sendEmailVerification() async {
    final user = auth.currentUser; // getting current user
    if (user != null && !user.emailVerified) {
      return await user.sendEmailVerification();
    }
  }

  Future<bool> isEmailVerified() async {
    User? user = auth.currentUser;
    if (user != null) {
      await user.reload();
      return user.emailVerified;
    }
    return false;
  }
}
