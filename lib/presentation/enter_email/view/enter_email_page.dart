import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/form_consumer.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/enter_email/cubit/enter_email_cubit.dart';
import 'package:business_terminal/presentation/enter_email/form_validation/enter_email_form_validation.dart';
import 'package:business_terminal/presentation/otp_verification/view/otp_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EmailVerificationArguments {
  EmailVerificationArguments({required this.email});

  final String email;
}

class EnterEmailPage extends StatelessWidget {
  const EnterEmailPage({super.key, required this.emailArguments});

  final EmailVerificationArguments emailArguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EnterEmailCubit>(
      create: (context) => getIt.get<EnterEmailCubit>(),
      child: EnterEmailView(
        emailArguments: emailArguments,
      ),
    );
  }
}

class EnterEmailView extends StatelessWidget {
  const EnterEmailView({
    Key? key,
    required this.emailArguments,
  }) : super(key: key);

  final EmailVerificationArguments emailArguments;
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
                  text: emailArguments.email,
                  style: inter14.copyWith(
                    color: denim,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocConsumer<EnterEmailCubit, EnterEmailState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                Navigator.of(context).pushReplacementNamed(
                  EmailVerificationPage.path,
                  arguments: {'email': emailArguments},
                );
              },
            );
          },
          builder: (context, state) {
            return ReactiveFormBuilder(
              form: EnterEmailFormSettings().buildForm,
              builder: (
                BuildContext context,
                FormGroup formGroup,
                Widget? child,
              ) {
                return Column(
                  children: [
                    const SizedBox(height: 24),
                    FormTextField(
                      name: EnterEmailFormSettings.emailField,
                      validationMessages: (control) =>
                          EnterEmailFormSettings.validationMessageEmail,
                    ),
                    const SizedBox(height: 24),
                    FormConsumer(
                      onTap: (form) {
                        context
                            .read<EnterEmailCubit>()
                            .resendOtpCode(emailArguments.email);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
