import 'package:business_terminal/presentation/common/widgets/onboarding_container_title_subtitle.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_wrapper_with_background_image.dart';
import 'package:business_terminal/presentation/registration/email_verification/view/email_was_sent_text_icon.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmailVerificationView();
  }
}

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({Key? key}) : super(key: key);

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  @override
  Widget build(BuildContext context) {
    const title = 'Bestätigen Sie Ihre \nE-Mail-Adresse.';
    const subtitle =
        'Eine E-Mail ist unterwegs an die von Ihnen angegebenen Adresse beispiel@unternehmen.de. Bitte geben Sie den 5-stelligen Code ein, um IhreE-Mail-Adresse zu verifizieren. Sollte die E-Mail in Kürze nicht in Ihrer Inbox auftauchen, so kontrollieren Sie bitte auch Ihren Spam-Ordner.';

    const textEmailWasSent =
        'Sie erhalten in Kürze erneut eine E-Mail von uns.';
    const emailWasSentColor = Color(0xff549d4c);

    return OnboardingWrapperView(
      children: [
        Center(
          child: OnboardingContainerTitleSubtitle(
            title: title,
            subtitle: subtitle,
            children: [
              const SizedBox(
                height: 70,
                width: double.infinity,
                child: Pinput(length: 5),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    print('close pass validation window');
                  },
                  child: const Text(
                    'E-Mail erneut versenden',
                    style: TextStyle(color: Color(0xff147bd9)),
                  ),
                ),
              ),
              const EmailWasSentTextIcon(
                textEmailWasSent: textEmailWasSent,
                emailWasSentColor: emailWasSentColor,
                icon: Icons.send,
              ),
              Row(
                children: const [
                  WhiteButton(width: 320),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
