import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Page with message, then new password has been installed
/// Mockup - [https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/8b798cf6-3e2e-4f7b-b0f8-2bc323049889/]
class NewPasswordInstalledPage extends StatelessWidget {
  static const path = 'new_password_installed';

  const NewPasswordInstalledPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        body: Column(
          children: [
            SvgPicture.asset(
              Assets.imagesKeyThin,
              height: 80,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 24),
            Text(
              AppLocale.of(context).newPasswordInstalledTitle,
              style: inter24,
            ),
            const SizedBox(height: 24),
            Text(
              AppLocale.of(context).newPasswordIntalledDescription,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ActionButtonBlue(
              isEnabled: true,
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil(LoginPage.path, (route) => false),
            )
          ],
        ),
      ),
    );
  }
}
