import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/forgetpassword.dart/form_validation/forget_password_validation.dart';
import 'package:business_terminal/presentation/forgetpassword.dart/view/chooseverifypage.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgetPasswordEmailPage extends StatelessWidget {
  const ForgetPasswordEmailPage({Key? key}) : super(key: key);
  static const path = '/forgetpasswordemail';
  @override
  Widget build(BuildContext context) {
    return const ForgetPasswordEmailView();
  }
}

class ForgetPasswordEmailView extends StatefulWidget {
  const ForgetPasswordEmailView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordEmailView> createState() =>
      _ForgetPasswordEmailViewState();
}

class _ForgetPasswordEmailViewState extends State<ForgetPasswordEmailView> {
  final formSettings = ForgetPasswordFormSettings();

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: tr('forget_password'),
          subHeader: Text(tr('forget_password_subtitle')),
        ),
        body: Column(
          children: [
            ReactiveFormBuilder(
              form: formSettings.buildForm,
              builder: (context, form, child) {
                return Column(
                  children: [
                    const SizedBox(height: 25),
                    FormTextField(
                      name: formSettings.kfieldEmail,
                      label: 'E-Mail',
                      validationMessages: (control) =>
                          formSettings.validationMessageEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 200),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WhiteButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ReactiveFormConsumer(
                          builder: (context, formGroup, child) =>
                              ActionButtonBlue(
                            isEnabled: formGroup.valid,
                            onPressed: () => onPressNavigateToVerify(
                              context,
                              formGroup
                                  .control(formSettings.kfieldEmail)
                                  .value
                                  .toString(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void onPressNavigateToVerify(BuildContext context, String email) {
    Navigator.of(context)
        .pushNamed(ChooseVerifyPage.path, arguments: {'email': email});
  }
}
