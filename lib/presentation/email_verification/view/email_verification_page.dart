import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
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

class EmailVerificationPage
    extends OtpVerificationPage<EmailVerificationCubit> {
  const EmailVerificationPage({
    Key? key,
    required super.model,
  }) : super(key: key);

  static const path = '${RegistrationPage.path}/email_verification';
}

class PhoneVerificationPage
    extends OtpVerificationPage<EmailVerificationCubit> {
  const PhoneVerificationPage({
    Key? key,
    required super.model,
  }) : super(key: key);

  static const path = '${RegistrationPage.path}/phone_verification';
}

abstract class OtpVerificationPage<T extends OtpVerificationCubit>
    extends StatelessWidget {
  const OtpVerificationPage({
    super.key,
    required this.model,
  });

  final VerificationModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (context) => getIt.get<T>(),
      child: OtpVerificationView<T>(
        model: model,
      ),
    );
  }
}

class OtpVerificationView<T extends OtpVerificationCubit>
    extends StatefulWidget {
  const OtpVerificationView({
    super.key,
    required this.model,
  });

  final VerificationModel model;

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState<T>();
}

class _OtpVerificationViewState<T extends OtpVerificationCubit>
    extends State<OtpVerificationView> {
  final pinController = TextEditingController();
  final textEmailWasSent = 'Sie erhalten in Kürze erneut eine E-Mail von uns.';
  final textWrongOtp = 'Der eingegebene Code war ungültig.';
  final title = 'Bestätigen Sie Ihre \nE-Mail-Adresse.';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<T>();

    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: widget.model.title,
          subHeader: _SubHeaderRichText(widget: widget),
        ),
        body: Column(
          children: [
            _OtpVerificationPinWrapper<T>(
              pinController: pinController,
              widget: widget,
              cubit: cubit,
            ),
            _ResendOtpCodeButton(
              credential: widget.model.userCredentials,
              cubit: cubit,
            ),
            _OtpSentNotSentInfoBuilder<T>(
              model: widget.model,
              pinController: pinController,
            ),
            WhiteButton(
              width: 320,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            _OtpVerificationBlocListener<T>(
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
    required this.widget,
  });

  final OtpVerificationView widget;

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

class _OtpSentNotSentInfoBuilder<T extends OtpVerificationCubit>
    extends StatelessWidget {
  const _OtpSentNotSentInfoBuilder({
    required this.pinController,
    required this.model,
  });

  final VerificationModel model;
  final TextEditingController pinController;
  final String textEmailWasSent;
  final String textWrongOtp;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, OtpVerificationState>(
      builder: (context, state) {
        final emailSent = OtpResultInfoTextIcon(
          text: model.otpSentText,
          textColor: fruitSalad,
          icon: Icons.send,
        );

        final wrongOtp = OtpResultInfoTextIcon(
          text: model.wrongOtpText,
          textColor: razzmatazz,
          icon: Icons.error_outline_rounded,
        );

        const empty = SizedBox(height: 120);

        return state.whenOrNull(
              mailSent: () {
                pinController.clear();
                return emailSent;
              },
              wrongOTPCode: () {
                pinController.clear();
                return wrongOtp;
              },
            ) ??
            empty;
      },
    );
  }
}

class _OtpVerificationBlocListener<T extends OtpVerificationCubit>
    extends StatelessWidget {
  const _OtpVerificationBlocListener({
    required this.pinController,
  });

  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<T, OtpVerificationState>(
      listener: (context, state) {
        if (state is LoadingOtpVerification) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state is ErrorOtpVerification) {
          pinController.clear();

          final error = state.failure.exception as DioError;
          final errorMessage = error.response?.statusMessage ?? '';

          SnackBarManager.showError(errorMessage);
        }

        if (state is SuccessOtpVerification) {
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
      child: const SizedBox.shrink(),
    );
  }
}

class _ResendOtpCodeButton extends StatelessWidget {
  const _ResendOtpCodeButton({
    required this.credential,
    required this.cubit,
  });

  final String? credential;
  final OtpVerificationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          if (credential != null) {
            cubit.resendOtpCode(credential!);
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

class _OtpVerificationPinWrapper<T extends OtpVerificationCubit>
    extends StatefulWidget {
  const _OtpVerificationPinWrapper({
    required this.pinController,
    required this.widget,
    required this.cubit,
  });

  final EmailVerificationCubit cubit;
  final TextEditingController pinController;
  final OtpVerificationView widget;
  final OtpVerificationCubit cubit;

  @override
  State<_OtpVerificationPinWrapper> createState() =>
      _OtpVerificationPinWrapperState<T>();
}

class _OtpVerificationPinWrapperState<T extends OtpVerificationCubit>
    extends State<_OtpVerificationPinWrapper> {
  bool hasPinError = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, OtpVerificationState>(
      builder: (context, state) {
        hasPinError = state is WrongOtpVerification;

        final pin = _OtpVerificationPinInput(
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

class _OtpVerificationPinInput extends StatelessWidget {
  const _OtpVerificationPinInput({
    required this.pinController,
    required this.hasPinError,
    required this.widget,
    required this.cubit,
  });

  final EmailVerificationCubit cubit;
  final bool hasPinError;
  final OtpVerificationView widget;
  final OtpVerificationCubit cubit;

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
            cubit.verifyByOTPCode(email, value);
          } else {
            throw Exception('userEmail is null');
          }
        },
      ),
    );
  }
}
