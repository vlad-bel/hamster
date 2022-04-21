import 'package:business_terminal/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingWrapperView extends StatelessWidget {
  const OnboardingWrapperView({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesBackgroundImageSignUp,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(
              width: 120,
              height: 45,
              child: SvgPicture.asset(
                Assets.imagesHamsterLogo,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: children,
          ),
        ],
      ),
    );
  }
}
