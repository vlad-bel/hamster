import 'package:flutter/material.dart';

class SimpleButtonLightBlue extends StatelessWidget {
  const SimpleButtonLightBlue({
    super.key,
    this.isEnabled = false,
    this.width,
    required this.onPressed,
    required this.text,
  });

  final bool isEnabled;
  final VoidCallback onPressed;
  final double? width;
  final String text;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.5),
    );

    return SizedBox(
      width: width ?? 250,
      height: 34,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xfff7f8f9),
          onPrimary: const Color(0xff147bd9),
          elevation: 0.1,
          shape: shape,
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(text),
      ),
    );
  }
}
