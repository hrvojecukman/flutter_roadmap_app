import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static Stream<User?> firebaseUserListener() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
