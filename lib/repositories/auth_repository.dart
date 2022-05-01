import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:login_template_firebase/common/configuration/injection.dart';
import 'package:login_template_firebase/common/errors/app_failure.dart';
import 'package:login_template_firebase/common/info/info_cubit.dart';
import 'package:login_template_firebase/features/login/repository/user_repository.dart';

abstract class AuthRepository {
  Future<void> signIn({
    required AuthCredential? credential,
    GoogleAuthProvider? googleProvider,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Stream<User?> getUserStream();
}

@Injectable(as: AuthRepository)
class AppAuthRepository implements AuthRepository {
  final UserRepository _userRepository;
  final _firebaseAuth = FirebaseAuth.instance;

  AppAuthRepository(this._userRepository);

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> signIn({
    required AuthCredential? credential,
    GoogleAuthProvider? googleProvider,
  }) async {
    ///Web sign in
    if (googleProvider != null) {
      await _firebaseAuth.signInWithPopup(googleProvider);
    } else {
      await _firebaseAuth.signInWithCredential(credential!);
    }
  }

  @override
  Stream<User?> getUserStream() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (err) {
      locator<InfoCubit>().errorOccurred(
        AppFailure(err.message ?? "Login error"),
      );
    }
  }

  @override
  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (err) {
      locator<InfoCubit>().errorOccurred(
        AppFailure(err.message ?? "Error while creating a user!"),
      );
    }
    return null;
  }
}
