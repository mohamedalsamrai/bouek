import 'package:firebase_auth/firebase_auth.dart';
import 'package:bouek/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _auth;

  AuthRepositoryImpl(this._auth);

  @override
  Future<void> registerUser(String email, String password) async {
    try {
      // trying to register user using firebase auth
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      // catch any registration errors and print them here etc
      print('Registration Failed : $e');
      rethrow;
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser; // getting current user
    if (user != null && !user.emailVerified) {
      try {
        await user.sendEmailVerification();
      } catch (e) {
        /* any errors or exceptions regarding
        email verification
        will be caught here for printing etC
         */
        print('Email verification failed : $e');
        rethrow;
      }
    }
  }
  @override
  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;

    if (user != null) {
      await user.reload();
      return user.emailVerified;
    }
    return false;
  }
}
