import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
