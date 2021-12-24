import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String title;

  const Page2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
