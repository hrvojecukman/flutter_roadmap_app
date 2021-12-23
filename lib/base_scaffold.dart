import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is Base Scaffold"),
      ),
    );
  }
}
