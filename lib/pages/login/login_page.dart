import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_template_firebase/cubits/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: Colors.blue,
        onPressed: () {
          BlocProvider.of<AuthCubit>(context).signInWithGoogle();
        },
        child: const Text("Login with google"),
      ),
    );
  }
}
