import 'package:firebase_auth/firebase_auth.dart';

bool checkUserState() {
  if (FirebaseAuth.instance.currentUser != null) {
    if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
      return true;
    }
  }
  return false;
}