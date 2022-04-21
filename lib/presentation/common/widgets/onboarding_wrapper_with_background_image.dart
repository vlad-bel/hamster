import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_appbar/onboarding_appbar.dart';
import 'package:flutter/material.dart';

///View that uses on registration screens
class OnboardingWrapperView extends StatelessWidget {
  const OnboardingWrapperView({
    Key? key,
    required this.children,
  }) : super(key: key);

  final Widget children;

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
                const OnboardingAppbar(),
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
