import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CallMethodSelectorForm extends StatefulWidget {
  const CallMethodSelectorForm({
    Key? key,
    required this.number,
  }) : super(key: key);

  final String number;

  @override
  State<CallMethodSelectorForm> createState() => _CallMethodSelectorFormState();
}

class _CallMethodSelectorFormState extends State<CallMethodSelectorForm> {
  var smsSelected = true;

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
        children: OnboardingWhiteContainer(
      width: 452,
      header: OnboardingWhiteContainerHeader(
        header: AppLocalizations.of(context).confirm_number_title,
        subHeader: RichText(
          text: TextSpan(
            style: inter14,
            text: AppLocalizations.of(context).call_method1,
            children: [
              TextSpan(
                style: inter14Medium.copyWith(color: denim),
                text: widget.number,
              ),
              TextSpan(
                style: inter14,
                  text: AppLocalizations.of(context).call_method2,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 28,
          ),
          Row(children: [
            SelectorRect(
              title: 'SMS',
              image: Icons.sms,
              choosed: smsSelected,
              onTap: () {
                setState(() {
                  smsSelected = true;
                });
              },
            ),
            SizedBox(width: 28),
            SelectorRect(
              title: 'Anruf',
              image: Icons.call_outlined,
              choosed: !smsSelected,
              onTap: () {
                setState(() {
                  smsSelected = false;
                });
              },
            ),
          ]),
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WhiteButton(width: 162, onPressed: () {}),
              SizedBox(width: 24),
              ActionButtonBlue(
                width: 162,
                isEnabled: true,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class SelectorRect extends StatelessWidget {
  const SelectorRect({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.choosed,
  }) : super(key: key);

  final IconData image;
  final String title;
  final VoidCallback onTap;

  final bool choosed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 162,
        height: 162,
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: choosed ? denim : lynch),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            boxShadow: [
              if (choosed)
                BoxShadow(
                  blurRadius: 6,
                  offset: Offset(0, 3),
                  color: Colors.black.withOpacity(0.3),
                )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              image,
              size: 50,
              color: denim.withOpacity(.5),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: inter16,
            ),
          ],
        ),
      ),
    );
  }
}
