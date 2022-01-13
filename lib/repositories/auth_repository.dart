import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signIn(AuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

abstract class IAuthRepository {
  Future<void> signIn(AuthCredential credential);

  Future<void> signOut();
}
