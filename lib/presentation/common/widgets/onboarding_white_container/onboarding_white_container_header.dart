import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';

///header for OnboardingWhiteContainer
class OnboardingWhiteContainerHeader extends StatelessWidget {
  const OnboardingWhiteContainerHeader({
    Key? key,
    required this.header,
    required this.subHeader,
  }) : super(key: key);

  final String header;
  final Widget subHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: inter24,
        ),
        const SizedBox(height: 32),
        Container(
          width: 45,
          height: 3,
          color: lynch.withOpacity(0.1),
        ),
        const SizedBox(height: 28),
        subHeader,
      ],
    );
  }
}
