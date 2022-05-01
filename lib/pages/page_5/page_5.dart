import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_roadmap/cubits/auth_cubit.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
