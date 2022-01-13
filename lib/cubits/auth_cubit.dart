import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:login_template_firebase/repositories/auth_repository.dart';

@Injectable()
class AuthCubit extends Cubit<User?> {
  AuthCubit(this._authRepository) : super(null) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      print("CHANGE");
      emit(user);
    });
  }

  final IAuthRepository _authRepository;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //TODO: Add error handling
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _authRepository.signIn(credential);
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

//TODO: implement sign in with apple
// Future<User> signInWithApple() async {

// final credential = await SignInWithApple.getAppleIDCredential(
//   scopes: [
//     AppleIDAuthorizationScopes.email,
//     AppleIDAuthorizationScopes.fullName,
//   ],
//   webAuthenticationOptions: WebAuthenticationOptions(
//     // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
//     clientId:
//     'de.lunaone.flutter.signinwithappleexample.service',
//
//     redirectUri:
//     // For web your redirect URI needs to be the host of the "current page",
//     // while for Android you will be using the API server that redirects back into your app via a deep link
//     kIsWeb
//         ? Uri.parse('https://${window.location.host}/')
//         : Uri.parse(
//       'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
//     ),
//   ),
//   // TODO: Remove these if you have no need for them
//   nonce: 'example-nonce',
//   state: 'example-state',
// );
//
// // ignore: avoid_print
// print(credential);
//
// // This is the endpoint that will convert an authorization code obtained
// // via Sign in with Apple into a session in your system
// final signInWithAppleEndpoint = Uri(
//   scheme: 'https',
//   host: 'flutter-sign-in-with-apple-example.glitch.me',
//   path: '/sign_in_with_apple',
//   queryParameters: <String, String>{
//     'code': credential.authorizationCode,
//     if (credential.givenName != null)
//       'firstName': credential.givenName!,
//     if (credential.familyName != null)
//       'lastName': credential.familyName!,
//     'useBundleId':
//     !kIsWeb && (Platform.isIOS || Platform.isMacOS)
//         ? 'true'
//         : 'false',
//     if (credential.state != null) 'state': credential.state!,
//   },
// );
//
// final session = await http.Client().post(
//   signInWithAppleEndpoint,
// );
//
// // If we got this far, a session based on the Apple ID credential has been created in your system,
// // and you can now set this as the app's session
// // ignore: avoid_print
// print(session);
// }
}
