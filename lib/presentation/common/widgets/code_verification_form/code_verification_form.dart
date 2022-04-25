import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamster_widgets/hamster_widgets.dart';

///code confirmation form
///can be useful for some cases in registration flow
///https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/5c2778fb-3e73-4557-9a88-cc4da0d55aa4/
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
    this.verificationError,
    this.verificationDescription,
  }) : super(key: key);

  final String header;
  final Widget subheader;
  final String resendButtonTitle;
  final Widget? verificationError;
  final Widget? verificationDescription;
  final VoidCallback resendButtonCallback;
  final VoidCallback backButtonCallback;
  final Function(String code)? onCompleted;
  final Function(String code)? onChanged;
  final bool? hasError;

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
            if (hasError ?? false)
              verificationError ?? const SizedBox()
            else
              verificationDescription ?? const SizedBox(),
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
