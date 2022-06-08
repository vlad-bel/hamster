import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/form_consumer.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/enter_email/form_validation/enter_email_form_validation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EnterEmailPage extends StatelessWidget {
  const EnterEmailPage({
    Key? key,
    required this.previousEmail,
  }) : super(key: key);

  final String previousEmail;
  static const path = '/enter_email';

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).do_you_intend_change_email,
          subHeader: RichText(
            text: TextSpan(
              text: AppLocale.of(context).which_new_email,
              style: inter14,
              children: [
                TextSpan(
                  text: previousEmail,
                  style: inter14.copyWith(
                    color: denim,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ReactiveFormBuilder(
          form: EnterEmailFormSettings().buildForm,
          builder: (
            BuildContext context,
            FormGroup formGroup,
            Widget? child,
          ) {
            return Column(
              children: [
                const SizedBox(height: 24),
                const FormTextField(
                  name: EnterEmailFormSettings.emailField,
                ),
                const SizedBox(height: 24),
                FormConsumer(
                  onTap: (form) {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
