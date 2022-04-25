import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/country_code_selector.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';

///form for [CountriesListPage]
class ContryCodeForm extends StatelessWidget {
  const ContryCodeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: context.l10n.confirm_number_title,
          subHeader: Text(
            context.l10n.select_number_title,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 28),
            CountryCodeSelector(
              onChange: (value) {},
            ),
            const SizedBox(height: 150),
            ActionButtonBlue(
              width: double.infinity,
              onPressed: () {},
              isEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}