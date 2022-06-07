import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/email_verification/cubit/email_verification_cubit.dart';
import 'package:business_terminal/presentation/email_verification/view/email_was_sent_text_icon.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamster_widgets/hamster_widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

class VerificationModel {
  final String? userCredentials;
  final String title;
  final String wrongOtpText;
  final String otpSentText;
  final String previousEmailText;
  final String previousEmailSpamText;

  VerificationModel({
    required this.userCredentials,
    required this.title,
    required this.wrongOtpText,
    required this.otpSentText,
    required this.previousEmailText,
    required this.previousEmailSpamText,
  });
}

class EmailVerificationPage<T extends EmailVerificationCubit>
    extends StatelessWidget {
  const EmailVerificationPage({
    super.key,
    required this.model,
  });

  final VerificationModel model;

  static const path = '${RegistrationPage.path}/email_verification';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailVerificationCubit>(
      create: (context) => getIt.get<EmailVerificationCubit>(),
      child: EmailVerificationView(
        model: model,
      ),
    );
  }
}

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({
    super.key,
    required this.model,
  });

  final VerificationModel model;

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EmailVerificationCubit>();

    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: widget.model.title,
          subHeader: _SubHeaderRichText(widget: widget),
        ),
        body: Column(
          children: [
            _EmailVerificationPinWrapper(
              pinController: pinController,
              widget: widget,
              cubit: cubit,
            ),
            _ResendEmailCodeButton(
              userEmail: widget.model.userCredentials,
              cubit: cubit,
            ),
            _EmailSentNotSentInfoBuilder(
              textEmailWasSent: widget.model.otpSentText,
              emailWasSentColor: fruitSalad,
              textWrongOtp: widget.model.wrongOtpText,
              pinController: pinController,
            ),
            WhiteButton(
              width: 320,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            _EmailVerificationBlocListener(
              pinController: pinController,
            ),
          ],
        ),
      ),
    );
  }
}

class _SubHeaderRichText extends StatelessWidget {
  const _SubHeaderRichText({
    super.key,
    required this.widget,
  });

  final EmailVerificationView widget;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: widget.model.previousEmailText,
        style: inter14.copyWith(height: 1.6),
        children: [
          TextSpan(
            text: widget.model.userCredentials,
            style: inter14.copyWith(color: denim),
          ),
          TextSpan(
            text: widget.model.previousEmailSpamText,
            style: inter14,
          ),
        ],
      ),
    );
  }
}

class _EmailSentNotSentInfoBuilder extends StatelessWidget {
  const _EmailSentNotSentInfoBuilder({
    required this.textEmailWasSent,
    required this.emailWasSentColor,
    required this.textWrongOtp,
    required this.pinController,
  });

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

class _EmailVerificationBlocListener extends StatelessWidget {
  const _EmailVerificationBlocListener({
    required this.pinController,
  });

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

class _ResendEmailCodeButton extends StatelessWidget {
  const _ResendEmailCodeButton({
    required this.userEmail,
    required this.cubit,
  });

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

class _EmailVerificationPinWrapper extends StatefulWidget {
  const _EmailVerificationPinWrapper({
    required this.pinController,
    required this.widget,
    required this.cubit,
  });

  final TextEditingController pinController;
  final EmailVerificationView widget;
  final EmailVerificationCubit cubit;

  @override
  State<_EmailVerificationPinWrapper> createState() =>
      _EmailVerificationPinWrapperState();
}

class _EmailVerificationPinWrapperState
    extends State<_EmailVerificationPinWrapper> {
  bool hasPinError = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      builder: (context, state) {
        hasPinError = state is WrongOTPEmailVerification;

        final pin = _EmailVerificationPinInput(
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

class _EmailVerificationPinInput extends StatelessWidget {
  const _EmailVerificationPinInput({
    required this.pinController,
    required this.hasPinError,
    required this.widget,
    required this.cubit,
  });

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
          final email = widget.model.userCredentials;
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
