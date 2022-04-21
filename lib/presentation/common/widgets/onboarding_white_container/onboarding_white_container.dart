import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';

///white container that uses in all pages for initial screens
class OnboardingWhiteContainer extends StatelessWidget {
  const OnboardingWhiteContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(
            top: 45,
            left: 50,
            right: 50,
            bottom: 50,
          ),
          decoration: const BoxDecoration(
            color: white,
          ),
          child: child,
        ),
      ),
    );
  }
}
