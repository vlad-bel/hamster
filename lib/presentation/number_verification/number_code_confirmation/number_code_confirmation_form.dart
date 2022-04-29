import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/code_verification_form/code_verification_form.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_state.dart';
import 'package:business_terminal/presentation/number_verification/result_page/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class NumberCodeConfirmationForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocConsumer<NumberCodeConfirmationCubit,
        NumberCodeConfirmationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            if (response == 'ok') {
              Routemaster.of(context).push(
                ResultPage.path,
              );
            }
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
        return CodeVerificationForm(
          header: context.l10n.confirm_number_title,
          subheader: RichText(
            text: TextSpan(
              text: context.l10n.confirm_number_subtitle1,
              style: inter14.copyWith(height: 1.6),
              children: [
                TextSpan(
                  text: phone,
                  style: inter14.copyWith(color: denim),
                ),
                TextSpan(
                  text: context.l10n.confirm_number_subtitle2,
                  style: inter14,
                ),
              ],
            ),
          ),
          onCompleted: (code) {
            cubit.sendConfirmationCode(
              email: email,
              code: code,
            );
          },
          hasError: cubit.state is CodeErrorCodeConfirmationState,
          backButtonCallback: () {
            Routemaster.of(context).pop();
          },
          resendButtonCallback: () {
            cubit.resendVerificationCode(
              email: email,
              method: verifyMethod,
            );
          },
          resendButtonTitle: context.l10n.sms_resend,
        );
      },
    );
  }
}
