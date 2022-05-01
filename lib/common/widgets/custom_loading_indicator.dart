import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final String? text;
  final bool dark;

  const CustomLoadingIndicator({
    Key? key,
    this.text,
    this.dark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(dark ? 0.5 : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (text != null) Text(text!),
        ],
      ),
    );
  }
}
