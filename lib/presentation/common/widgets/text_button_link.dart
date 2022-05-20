import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';

class TextButtonBlueLink extends StatelessWidget {
  const TextButtonBlueLink({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: denim),
      ),
    );
  }
}
