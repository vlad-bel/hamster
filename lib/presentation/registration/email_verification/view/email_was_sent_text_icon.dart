import 'package:flutter/material.dart';

class EmailWasSentTextIcon extends StatelessWidget {
  const EmailWasSentTextIcon({
    Key? key,
    required this.textEmailWasSent,
    required this.emailWasSentColor,
    required this.icon,
  }) : super(key: key);

  final String textEmailWasSent;
  final Color emailWasSentColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          Icon(
            icon,
            color: emailWasSentColor,
          ),
          Container(width: 6),
          Flexible(
            child: Text(
              textEmailWasSent,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: emailWasSentColor,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
