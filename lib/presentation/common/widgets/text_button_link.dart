import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';

class TextButtonBlueLink extends StatelessWidget {
  const TextButtonBlueLink({
    Key? key,
    required this.onPressed,
    required this.text,
    this.customStyle,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final TextStyle? customStyle;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: customStyle ??
            inter14.copyWith(
              color: denim,
            ),
      ),
    );
  }
}
