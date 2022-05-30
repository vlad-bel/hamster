import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/add_logo_widget.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';

class ProfileAddLogoPage extends StatelessWidget {
  const ProfileAddLogoPage({
    Key? key,
  }) : super(key: key);

  static const String path = myCompanyEditAddLogoPath;

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).addYourCompanyLogo,
          subHeader: Text(AppLocale.current.addYourCompanyLogoDescription),
        ),
        body: Column(
          children: [
            SizedBox(height: 24),
            AppAddLogoWidget(
              onPressed: () {},
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WhiteButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ActionButtonBlue(
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
