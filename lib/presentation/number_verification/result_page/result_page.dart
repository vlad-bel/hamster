import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmaion_page.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';

class PhoneVerificationResultPage extends StatelessWidget {
  static const path = '${NumberCodeConfirmationPage.path}/result_page';

  const PhoneVerificationResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        body: Column(
          children: [
            const PercentsRect(),
            Image.asset(
              Assets.imagesProfileIcon,
              width: 100,
            ),
            const SizedBox(height: 36),
            Text(
              AppLocale.of(context).user_account_created,
              style: inter24,
            ),
            const SizedBox(height: 20),
            Text(
              AppLocale.of(context).user_account_created_description,
              style: inter14,
            ),
            const SizedBox(height: 36),
            ActionButtonBlue(
              width: double.infinity,
              isEnabled: true,
              onPressed: () => goToNextPage(context),
            ),
          ],
        ),
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(LoginPage.path);
  }
}

// TODO: unify that widget with one on DashboardAccountVerificationPage later
class PercentsRect extends StatelessWidget {
  const PercentsRect({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: fruitSalad.withOpacity(0.05),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Text(
          '100%',
          style: inter14.copyWith(color: fruitSalad),
        ),
      ),
    );
  }
}
