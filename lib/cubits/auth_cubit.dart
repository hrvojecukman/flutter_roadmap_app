import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_template_firebase/repositories/auth_repository.dart';

class AuthCubit extends Cubit<User?> {
  AuthCubit() : super(null) {
    print("INICIJALIZACIJA");
    AuthRepository.firebaseUserListener().listen((user) {
      print("prvi emit");
      emit(user);
    });
  }
}
