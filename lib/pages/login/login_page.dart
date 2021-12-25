import 'package:flutter/material.dart';
import 'package:login_template_firebase/repositories/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: Colors.blue,
        onPressed: () async {
          await AuthRepository.signInWithGoogle();
        },
        child: const Text("Login with google"),
      ),
    );
  }
}
