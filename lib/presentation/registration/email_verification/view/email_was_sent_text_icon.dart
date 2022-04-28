import 'package:flutter/material.dart';

class EmailResultInfoTextIcon extends StatelessWidget {
  const EmailResultInfoTextIcon({
    Key? key,
    required this.text,
    required this.textColor,
    required this.icon,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
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
