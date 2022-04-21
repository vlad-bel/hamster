import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_wrapper_with_background_image.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamster_widgets/hamster_widgets.dart';

///Verifiate number screen
///https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/5c2778fb-3e73-4557-9a88-cc4da0d55aa4/
class NumberVerificationForm extends StatelessWidget {
  const NumberVerificationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingWrapperView(
      children: SizedBox(
        width: 450,
        child: OnboardingWhiteContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OnboardingWhiteContainerHeader(
                header: AppLocalizations.of(context).confirm_number_title,
                subHeader: RichText(
                  text: TextSpan(
                    text:
                        AppLocalizations.of(context).confirm_number_subtitle1,
                    style: inter14.copyWith(height: 1.6),
                    children: [
                      TextSpan(
                        ///add real number
                        text: '+4912345678910',
                        style: inter14.copyWith(color: denim),
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)
                            .confirm_number_subtitle2,
                        style: inter14,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 46),
              Pincode(
                fieldCount: 5,
                width: 62,
                height: 87,
                textStyle: HamsterStyles.pincodeWeb,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Transform.translate(
                  offset: const Offset(14, 0),
                  child: CupertinoButton(
                    child: Text(
                      AppLocalizations.of(context).sms_resend,
                      style: inter14.copyWith(
                        color: denim,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      color: razzmatazz,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      AppLocalizations.of(context).sms_invalid,
                      style: inter14.copyWith(
                        color: razzmatazz,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 43),
              WhiteButton(
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}