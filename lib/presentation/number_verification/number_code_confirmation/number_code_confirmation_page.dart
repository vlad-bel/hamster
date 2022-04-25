import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/common/widgets/code_verification_form/code_verification_form.dart';
import 'package:flutter/material.dart';

class NumberCodeConfirmationPage extends StatelessWidget {
  const NumberCodeConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CodeVerificationForm(
      header: context.l10n.confirm_number_title,
      subheader: RichText(
        text: TextSpan(
          text: context.l10n.confirm_number_subtitle1,
          style: inter14.copyWith(height: 1.6),
          children: [
            TextSpan(
              ///add real number
              text: '+4912345678910',
              style: inter14.copyWith(color: denim),
            ),
            TextSpan(
              text: context.l10n.confirm_number_subtitle2,
              style: inter14,
            ),
          ],
        ),
      ),
      backButtonCallback: () {},
      resendButtonCallback: () {},
      resendButtonTitle: context.l10n.sms_resend,
    );
  }
}
