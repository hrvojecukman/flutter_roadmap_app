import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  final String title;

  const Page5({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
