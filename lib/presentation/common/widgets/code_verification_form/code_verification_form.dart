import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:hamster_widgets/hamster_widgets.dart';

///code confirmation form
///can be useful for some cases in registration flow
///examples:
///https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/fd9d4f43-e140-4c78-b1bd-cd1036fff4e6/
///https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/7f57707c-9d22-4df4-a744-706757ad016d/
class CodeVerificationForm extends StatelessWidget {
  const CodeVerificationForm({
    Key? key,
    required this.header,
    required this.subheader,
    required this.resendButtonTitle,
    required this.resendButtonCallback,
    required this.backButtonCallback,
    this.onCompleted,
    this.onChanged,
    this.hasError,
    required this.verificationResult,
    this.controller,
  }) : super(key: key);

  /// Header text
  final String header;

  /// Subheader widget. Can be usual text or rich text
  /// It depends from concrete screen
  final Widget subheader;

  final Widget verificationResult;

  ///Title for resend button. It can be different depend from screens
  final String resendButtonTitle;

  ///Callback for resend button
  final VoidCallback resendButtonCallback;

  /// Callback for back button
  final VoidCallback backButtonCallback;

  ///Fires when code typing ends
  final Function(String code)? onCompleted;

  ///Fires when code typing
  final Function(String code)? onChanged;

  ///External flag for showing error status
  ///Need switch to true for showing red border for pincode and showing
  ///error verificationError widget
  final bool? hasError;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: header,
          subHeader: subheader,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 46),
            Pincode(
              controller: controller,
              fieldCount: 5,
              width: 62,
              height: 87,
              textStyle: HamsterStyles.pincodeWeb,
              hasError: hasError,
              onChanged: onChanged,
              onCompleted: onCompleted,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Transform.translate(
                offset: const Offset(14, 0),
                child: CupertinoButton(
                  onPressed: resendButtonCallback,
                  child: Text(
                    resendButtonTitle,
                    style: inter14.copyWith(
                      color: denim,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            verificationResult,
            const SizedBox(height: 43),
            WhiteButton(
              onPressed: backButtonCallback,
            ),
          ],
        ),
      ),
    );
  }
}
