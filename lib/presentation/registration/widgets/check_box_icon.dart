import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';

class CheckBoxIconGreen extends StatelessWidget {
  const CheckBoxIconGreen({
    required this.text,
    required this.enabled,
    Key? key,
  }) : super(key: key);

  final bool enabled;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 14),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: enabled ? const Color(0xff549d4c) : const Color(0xfff3f6f8),
          ),
          Container(width: 8),
          Text(text)
        ],
      ),
    );
  }
}
