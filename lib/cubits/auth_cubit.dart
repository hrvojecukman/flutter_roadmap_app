import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:login_template_firebase/common/configuration/injection.dart';
import 'package:login_template_firebase/common/errors/app_failure.dart';
import 'package:login_template_firebase/common/info/info_cubit.dart';
import 'package:login_template_firebase/features/login/domain/cubits/user_cubit.dart';
import 'package:login_template_firebase/repositories/auth_repository.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthCubit(this._authRepository) : super(const AuthInitial()) {
    _listen();
  }

  void _listen() {
    emit(const AuthLoading());
    _authRepository.getUserStream().listen((user) {
      if (user != null) {
        emit(AuthPassed(user));
      } else {
        emit(const AuthInitial());
      }
    });
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //TODO: Add error handling
  Future<void> signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      await _signIn(null, googleAuthProvider: authProvider);
    } else {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _signIn(credential);
      }
    }
  }

  Future<void> _signIn(
    AuthCredential? credential, {
    GoogleAuthProvider? googleAuthProvider,
  }) async {
    if (credential == null && googleAuthProvider == null) {
      _emitError("Login error!");
    } else {
      await _authRepository.signIn(
        credential: credential,
        googleProvider: googleAuthProvider,
      );
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(const AuthInitial());
    locator<UserCubit>().signOut();
  }

  Future<void> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    await _signIn(oauthCredential);
  }

  // Future<void> deleteAccount() async {
  //   final response = await _authRepository.deleteAccount();
  //   response.fold(
  //     (l) => _emitError(l.error),
  //     (r) => locator<InfoCubit>().showInfo("User deleted"),
  //   );
  // }

  _emitError(String error) {
    emit(AuthError(error));
    locator<InfoCubit>().errorOccurred(AppFailure(error));
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}

enum ProviderId { google, apple }

extension ProviderIdString on ProviderId {
  static const _text = {
    ProviderId.apple: "apple.com",
    ProviderId.google: "google.com",
  };

  String get text => _text[this]!;
}
