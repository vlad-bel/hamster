import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/add_logo_widget.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Screen with placeholder for personal avatar uploading
/// Mockups is not provided. Layout is inspired by [https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/b11e8ab5-d38c-4133-8301-12e5abc998cd/]
class AddPersonalAvatarPage extends StatelessWidget {
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
              AppAddLogoWidget(onPressed: () {
                context.read<EditPersonalDataCubit>().pickNewAvatar();
              }),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: WhiteButton(
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ActionButtonBlue(
                      isEnabled: true,
                      child: Text(AppLocale.of(context).save),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
