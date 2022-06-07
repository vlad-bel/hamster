import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/add_logo_widget.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:flutter/material.dart';

class AddPersonalAvatarPage extends StatelessWidget {
  static const path = 'add_personal_avatar';

  const AddPersonalAvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      showLanguageDropdown: false,
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).addYourCompanyLogo,
          subHeader: Text(
            AppLocale.of(context).addYourCompanyLogoDescription,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              AppAddLogoWidget(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
