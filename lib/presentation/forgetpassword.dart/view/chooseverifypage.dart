import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/forgetpassword.dart/cubit/forget_password_cubit.dart';
import 'package:business_terminal/presentation/forgetpassword.dart/view/pincoderesetpassword.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_form.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseVerifyPage extends StatelessWidget {
  final String email;
  const ChooseVerifyPage({super.key, required this.email});
  static const path = '/chooseverifypage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: ChooseVerifyView(
        email: email,
      ),
    );
  }
}

class ChooseVerifyView extends StatelessWidget {
  final String email;
  const ChooseVerifyView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          sended: (type) => onPressNavigateToPinCodePage(
            context,
            email,
            type,
          ),
        );
        // TODO: implement listener
      },
      builder: (context, state) {
        return OnboardingBackground(
          children: OnboardingWhiteContainer(
            header: OnboardingWhiteContainerHeader(
              header: AppLocale.of(context).forget_password,
              subHeader: SubHeaderEmailRichText(
                email: email,
              ),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    SelectorRect(
                      size: 110,
                      title: AppLocale.of(context).email,
                      icon: Icons.email,
                      onTap: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .chooseTypeOfVerification('EMAIL');
                      },
                      choosed: state is Choosen ? state.type == 'EMAIL' : false,
                    ),
                    const SizedBox(width: 10),
                    SelectorRect(
                      size: 110,
                      title: AppLocale.of(context).sms,
                      icon: Icons.sms,
                      onTap: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .chooseTypeOfVerification('SMS');
                      },
                      choosed: state is Choosen ? state.type == 'SMS' : false,
                    ),
                    const SizedBox(width: 10),
                    SelectorRect(
                      size: 110,
                      title: AppLocale.of(context).phone_call,
                      icon: Icons.call_outlined,
                      onTap: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .chooseTypeOfVerification('PHONE_CALL');
                      },
                      choosed:
                          state is Choosen ? state.type == 'PHONE_CALL' : false,
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WhiteButton(
                      width: 162,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 24),
                    ActionButtonBlue(
                      width: 162,
                      isEnabled: state is Choosen,
                      onPressed: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .sendVerificationCode(email);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SubHeaderEmailRichText extends StatelessWidget {
  final String email;
  const SubHeaderEmailRichText({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppLocale.of(context).forgetpassword_email_subtitle,
        style: inter14.copyWith(height: 1.6),
        children: [
          TextSpan(
            text: email,
            style: inter14.copyWith(color: denim),
          ),
          TextSpan(
            text: AppLocale.of(context).forgetpassword_email_subtitle2,
            style: inter14,
          ),
        ],
      ),
    );
  }
}

void onPressNavigateToPinCodePage(
  BuildContext context,
  String email,
  String type,
) {
  Navigator.of(context).pushNamed(
    PinCodePasswordResetPage.path,
    arguments: {
      'email': email,
      'type': type,
    },
  );
}
