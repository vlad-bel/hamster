import 'package:flutter/material.dart';

class EmailResultInfoTextIcon extends StatelessWidget {
  const EmailResultInfoTextIcon({
    Key? key,
    required this.text,
    required this.textColor,
    required this.icon,
    this.height,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final IconData icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 120,
      child: Row(
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          Container(width: 6),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: textColor,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
