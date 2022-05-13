import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/email_verification/cubit/email_verification_cubit.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamster_widgets/hamster_widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'email_was_sent_text_icon.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({
    Key? key,
    required this.userEmail,
  }) : super(key: key);

  final String? userEmail;

  static const path = '${RegistrationPage.path}/email_verification';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailVerificationCubit>(
      create: (context) => getIt.get<EmailVerificationCubit>(),
      child: EmailVerificationView(userEmail: userEmail),
    );
  }
}

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({Key? key, this.userEmail}) : super(key: key);

  final String? userEmail;

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  final title = 'Bestätigen Sie Ihre \nE-Mail-Adresse.';
  final textWrongOtp = 'Der eingegebene Code war ungültig.';
  final textEmailWasSent = 'Sie erhalten in Kürze erneut eine E-Mail von uns.';
  final emailWasSentColor = fruitSalad;

  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EmailVerificationCubit>();

    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: title,
          subHeader: SubHeaderRichText(widget: widget),
        ),
        body: Column(
          children: [
            EmailVerificationPinWrapper(
              pinController: pinController,
              widget: widget,
              cubit: cubit,
            ),
            ResendEmailCodeButton(
              userEmail: widget.userEmail,
              cubit: cubit,
            ),
            EmailSentNotSentInfoBuilder(
              textEmailWasSent: textEmailWasSent,
              emailWasSentColor: emailWasSentColor,
              textWrongOtp: textWrongOtp,
              pinController: pinController,
            ),
            WhiteButton(
              width: 320,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            EmailVerificationBlocListener(
              pinController: pinController,
            ),
          ],
        ),
      ),
    );
  }
}

class SubHeaderRichText extends StatelessWidget {
  const SubHeaderRichText({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final EmailVerificationView widget;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Eine E-Mail ist unterwegs an die von Ihnen angegebenen Adresse ',
        style: inter14.copyWith(height: 1.6),
        children: [
          TextSpan(
            text: widget.userEmail,
            style: inter14.copyWith(color: denim),
          ),
          TextSpan(
            text:
                ' Bitte geben Sie den 5-stelligen Code ein, um IhreE-Mail-Adresse zu verifizieren. Sollte die E-Mail in Kürze nicht in Ihrer Inbox auftauchen, so kontrollieren Sie bitte auch Ihren Spam-Ordner.',
            style: inter14,
          ),
        ],
      ),
    );
  }
}

class EmailSentNotSentInfoBuilder extends StatelessWidget {
  const EmailSentNotSentInfoBuilder({
    Key? key,
    required this.textEmailWasSent,
    required this.emailWasSentColor,
    required this.textWrongOtp,
    required this.pinController,
  }) : super(key: key);

  final String textEmailWasSent;
  final Color emailWasSentColor;
  final String textWrongOtp;
  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      builder: (context, state) {
        final emailSent = EmailResultInfoTextIcon(
          text: textEmailWasSent,
          textColor: emailWasSentColor,
          icon: Icons.send,
        );

        final wrongOtp = EmailResultInfoTextIcon(
          text: textWrongOtp,
          textColor: razzmatazz,
          icon: Icons.error_outline_rounded,
        );

        const empty = SizedBox(height: 120);

        return state.whenOrNull(
              mailSent: () {
                pinController.clear();
                return emailSent;
              },
              wrongOTPcode: () {
                pinController.clear();
                return wrongOtp;
              },
            ) ??
            empty;
      },
    );
  }
}

class EmailVerificationBlocListener extends StatelessWidget {
  const EmailVerificationBlocListener({
    Key? key,
    required this.pinController,
  }) : super(key: key);

  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is LoadingEmailVerification) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state is ErrorEmailVerification) {
          pinController.clear();

          final error = state.failure.exception as DioError;
          final errorMessage = error.response?.statusMessage ?? '';

          SnackBarManager.showError(errorMessage);
        }

        if (state is SuccessEmailVerification) {
          SnackBarManager.showSuccess('OTP Code is correct');
          if (state.response == 'response') {
            Navigator.of(context).pushNamed(
              CountriesCodePage.path,
              arguments: {
                emailParam: state.email,
              },
            );
          }
        }
      },
      child: Container(),
    );
  }
}

class ResendEmailCodeButton extends StatelessWidget {
  const ResendEmailCodeButton({
    Key? key,
    required this.userEmail,
    required this.cubit,
  }) : super(key: key);

  final String? userEmail;
  final EmailVerificationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          if (userEmail != null) {
            cubit.resendEmailCode(userEmail!);
          } else {
            cubit.errorOccurred(
              UIFailure(
                'email is null',
                'ResendEmailCodeButton',
              ),
            );
          }
        },
        child: const Text(
          'E-Mail erneut versenden',
          style: TextStyle(color: denim),
        ),
      ),
    );
  }
}

class EmailVerificationPinWrapper extends StatefulWidget {
  const EmailVerificationPinWrapper({
    Key? key,
    required this.pinController,
    required this.widget,
    required this.cubit,
  }) : super(key: key);

  final TextEditingController pinController;
  final EmailVerificationView widget;
  final EmailVerificationCubit cubit;

  @override
  State<EmailVerificationPinWrapper> createState() =>
      _EmailVerificationPinWrapperState();
}

class _EmailVerificationPinWrapperState
    extends State<EmailVerificationPinWrapper> {
  bool hasPinError = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      builder: (context, state) {
        hasPinError = state is WrongOTPEmailVerification;

        final pin = EmailVerificationPinInput(
          pinController: widget.pinController,
          hasPinError: hasPinError,
          widget: widget.widget,
          cubit: widget.cubit,
        );

        return pin;
      },
    );
  }
}

class EmailVerificationPinInput extends StatelessWidget {
  const EmailVerificationPinInput({
    Key? key,
    required this.pinController,
    required this.hasPinError,
    required this.widget,
    required this.cubit,
  }) : super(key: key);

  final TextEditingController pinController;
  final bool hasPinError;
  final EmailVerificationView widget;
  final EmailVerificationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 8),
      child: Pincode(
        fieldCount: 5,
        width: 62,
        height: 87,
        controller: pinController,
        textStyle: HamsterStyles.pincodeWeb,
        hasError: hasPinError,
        onCompleted: (String value) {
          final email = widget.userEmail;
          if (email != null) {
            cubit.verifyEmailByOTPCode(email, value);
          } else {
            throw Exception('userEmail is null');
          }
        },
      ),
    );
  }
}
