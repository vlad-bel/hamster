import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_appbar/language_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingAppbar extends StatelessWidget {
  final bool showLanguageDropdown;

  const OnboardingAppbar({Key? key, this.showLanguageDropdown = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        const Spacer(),
        if (showLanguageDropdown)
          const Padding(
            padding: EdgeInsets.all(30),
            child: LanguageDropdown(),
          ),
      ],
    );
  }
}
