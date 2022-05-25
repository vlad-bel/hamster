import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0x4d676f86),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: child,
        ),
        Transform.translate(
          offset: Offset(20, -8),
          child: ColoredBox(
            color: white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                title,
                style: inter12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
