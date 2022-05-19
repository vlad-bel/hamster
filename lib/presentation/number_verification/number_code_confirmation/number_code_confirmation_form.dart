import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/code_verification_form/code_verification_form.dart';
import 'package:business_terminal/presentation/email_verification/view/email_was_sent_text_icon.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_state.dart';
import 'package:business_terminal/presentation/number_verification/result_page/result_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCodeConfirmationForm extends StatefulWidget {
  const NumberCodeConfirmationForm({
    Key? key,
    required this.phone,
    required this.email,
    required this.verifyMethod,
  }) : super(key: key);

  final String phone;
  final String email;
  final VerifyMethod verifyMethod;

  @override
  State<NumberCodeConfirmationForm> createState() =>
      _NumberCodeConfirmationFormState();
}

class _NumberCodeConfirmationFormState
    extends State<NumberCodeConfirmationForm> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NumberCodeConfirmationCubit,
        NumberCodeConfirmationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            Navigator.of(context).pushNamed(
              PhoneVerificationResultPage.path,
            );
          },
          resendError: (e) {
            SnackBarManager.showError(e.response.message.toString());
          },
          codeError: (e) {
            SnackBarManager.showError(e.response.message.toString());
          },
        );
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<NumberCodeConfirmationCubit>(context);
        final otpSent = widget.verifyMethod == VerifyMethod.phoneCall
            ? "Bestätigungscode erneut an Telefon gesendet"
            : "Bestätigungscode per SMS erneut gesendet";
        return CodeVerificationForm(
          controller: pinController,
          header: tr(LocaleKeys.confirm_number_title),
          subheader: RichText(
            text: TextSpan(
              text: tr(LocaleKeys.confirm_number_subtitle1),
              style: inter14.copyWith(height: 1.6),
              children: [
                TextSpan(
                  text: '+${widget.phone}',
                  style: inter14.copyWith(color: denim),
                ),
                TextSpan(
                  text: tr(LocaleKeys.confirm_number_subtitle2),
                  style: inter14,
                ),
              ],
            ),
          ),
          onCompleted: (code) {
            cubit.sendConfirmationCode(
              email: widget.email,
              code: code,
            );
          },
          hasError: cubit.state is CodeErrorCodeConfirmationState,
          backButtonCallback: () {
            Navigator.of(context).pop();
          },
          resendButtonCallback: () {
            cubit.resendVerificationCode(
              email: widget.email,
              method: widget.verifyMethod,
            );
          },
          resendButtonTitle: tr(LocaleKeys.sms_resend),
          verificationResult: NumberVerificationResult(
            pinController: pinController,
            emailWasSentColor: fruitSalad,
            textWrongOtp: 'Der eingegebene Code war ungültig.',
            textEmailWasSent: otpSent,
          ),
        );
      },
    );
  }
}

class NumberVerificationResult extends StatelessWidget {
  const NumberVerificationResult({
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
    return BlocBuilder<NumberCodeConfirmationCubit,
        NumberCodeConfirmationState>(
      builder: (context, state) {
        final emailSent = EmailResultInfoTextIcon(
          text: textEmailWasSent,
          textColor: emailWasSentColor,
          icon: Icons.send,
          height: 20,
        );

        final wrongOtp = EmailResultInfoTextIcon(
          text: textWrongOtp,
          textColor: razzmatazz,
          icon: Icons.error_outline_rounded,
          height: 20,
        );

        const empty = SizedBox(height: 20,);

        return state.whenOrNull(
              resend: () {
                pinController.clear();
                return emailSent;
              },
              codeError: (error) {
                pinController.clear();
                return wrongOtp;
              },
            ) ??
            empty;
      },
    );
  }
}
