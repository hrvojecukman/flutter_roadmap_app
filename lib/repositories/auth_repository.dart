import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  static Stream<User?> firebaseUserListener() {
    return FirebaseAuth.instance.authStateChanges();
  }

  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<UserCredential> signInAnonymously() async {
    return await FirebaseAuth.instance.signInAnonymously();
  }

  static Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await signInUser(credential: credential);
    }

    return FirebaseAuth.instance.currentUser;
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

  static Future<UserCredential?> signInUser({
    required AuthCredential credential,
    // List<appleSignIn.Scope> scopes,
  }) async {
    //Referral login
    UserCredential? userCredential;
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.isAnonymous) {
      try {
        userCredential = await FirebaseAuth.instance.currentUser!
            .linkWithCredential(credential);
        print("SPOJIO PODATKE O ANONYMOUS USERU");
      } catch (er) {
        FirebaseAuthException exception = er as FirebaseAuthException;
        if (exception.code == "credential-already-in-use") {
          print("USER VEC POSTOJI PA GA LOGIRAM NORMALNO!");
          AuthCredential tempCredential;
          // if (scopes != null) {
          // print("SPECIJALNO ZA APPLE LOGIN STVARAM ISPOČETKA");
          // final appleSignIn.AuthorizationResult result =
          // await appleSignIn.AppleSignIn.performRequests(
          //     [appleSignIn.AppleIdRequest(requestedScopes: scopes)]);
          // final appleIdCredential = result.credential;
          // final oAuthProvider = OAuthProvider('apple.com');
          // tempCredential = oAuthProvider.credential(
          //   idToken: String.fromCharCodes(appleIdCredential.identityToken),
          //   accessToken:
          //   String.fromCharCodes(appleIdCredential.authorizationCode),
          // );
          // } else {
          tempCredential = credential;
          // }
          userCredential =
              await FirebaseAuth.instance.signInWithCredential(tempCredential);
        }
      }
    } else {
      //Normal login
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("NORMALNI LOGIN");
    }
    return userCredential;
  }

  static Future<void> signOut() async {
    // return Future.wait([
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    // ]);
  }
}
