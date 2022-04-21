import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:flutter/material.dart';

///white container that uses in all pages for initial screens
class OnboardingWhiteContainer extends StatelessWidget {
  const OnboardingWhiteContainer({
    Key? key,
    this.header,
    required this.body,
    this.width = 450,
  }) : super(key: key);

  final OnboardingWhiteContainerHeader? header;
  final Widget body;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Center(
        child: Container(
          width: width,
          padding: const EdgeInsets.only(
            top: 45,
            left: 50,
            right: 50,
            bottom: 50,
          ),
          decoration: const BoxDecoration(
            color: white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              header ?? const SizedBox(),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
