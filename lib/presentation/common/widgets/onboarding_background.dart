import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_appbar/onboarding_appbar.dart';
import 'package:flutter/material.dart';

///View that uses on registration screens
class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground(
      {Key? key, required this.children, this.showLanguageDropdown = true})
      : super(key: key);

  final Widget children;
  final bool showLanguageDropdown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesBackgroundImageSignUp,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
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
    );
  }
}
