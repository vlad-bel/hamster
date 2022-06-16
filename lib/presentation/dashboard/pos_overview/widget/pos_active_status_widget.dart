import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';

class PosActiveStatusWidget extends StatelessWidget {
  const PosActiveStatusWidget({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: fruitSalad,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(3),
          child: const Icon(
            Icons.done,
            color: white,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          isActive
              ? AppLocale.of(context).active.toLowerCase()
              : AppLocale.of(context).inactive.toLowerCase(),
        ),
      ],
    );
  }
}
