import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final String title;

  const Page3({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
