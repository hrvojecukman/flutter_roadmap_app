import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_template_firebase/cubits/auth_cubit.dart';

class Page5 extends StatelessWidget {
  final String title;

  const Page5({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        MaterialButton(
          color: Colors.blue,
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).signOut();
          },
          child: const Text("Log out"),
        ),
      ],
    );
  }
}
