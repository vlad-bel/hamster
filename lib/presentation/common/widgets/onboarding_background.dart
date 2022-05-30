import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_appbar/onboarding_appbar.dart';
import 'package:flutter/material.dart';

///View that uses on registration screens
class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({
    Key? key,
    required this.children,
    this.showLanguageDropdown = true,
    this.hasScroll = true,
  }) : super(key: key);

  final Widget children;
  final bool showLanguageDropdown;
  final bool hasScroll;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Assets.imagesBackgroundImageSignUp,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              physics: !hasScroll
                  ? NeverScrollableScrollPhysics()
                  : AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  OnboardingAppbar(showLanguageDropdown: showLanguageDropdown),
                  Center(
                    child: children,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
