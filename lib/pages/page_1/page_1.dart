import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String title;

  const Page1({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
