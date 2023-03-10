import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';

class ConnectionCell extends StatelessWidget {
  const ConnectionCell({
    Key? key,
    required this.currentConnectionValue,
    required this.maxConnectionValue,
    required this.title,
  }) : super(key: key);

  final int currentConnectionValue;
  final int maxConnectionValue;
  final String title;

  Color get color {
    if (currentConnectionValue == 0) {
      return lynch;
    }
    if (currentConnectionValue < maxConnectionValue) {
      return denim;
    }

    return fruitSalad;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        color: color.withOpacity(0.1),
      ),
      padding: const EdgeInsets.only(
        left: 7,
        right: 7,
        top: 3,
        bottom: 5,
      ),
      child: Text(
        '$currentConnectionValue/$maxConnectionValue $title',
        style: inter14.copyWith(
          color: color,
        ),
      ),
    );
  }
}
