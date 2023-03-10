import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/country/country.dart';
import 'package:flutter/material.dart';

class NumberPrefix extends StatelessWidget {
  const NumberPrefix({
    Key? key,
    required this.country,
    required this.onTap,
  }) : super(key: key);

  final Country? country;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(country?.emoji ?? "no"),
          const SizedBox(width: 8),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16,
            color: lynch,
          ),
          const SizedBox(width: 8),
          Container(
            width: 1,
            height: 22,
            color: lynch.withOpacity(0.3),
          ),
          const SizedBox(width: 8),
          Text(
            '+${country?.phone ?? "no"}',
            style: inter14,
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
