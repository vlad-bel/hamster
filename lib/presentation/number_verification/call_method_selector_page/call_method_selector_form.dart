import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_state.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocalizations.of(context).confirm_number_title,
          subHeader: RichText(
            text: TextSpan(
              style: inter14,
              text: context.l10n.call_method1,
              children: [
                TextSpan(
                  style: inter14Medium.copyWith(color: denim),
                  text: widget.number,
                ),
                TextSpan(
                  style: inter14,
                  text: context.l10n.call_method2,
                  // text: context.l10n.confirm_number_subtitle1,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 28,
            ),
            BlocBuilder<CallMethodSelectorPageCubit,
                CallMethodSelectorPageState>(
              builder: (BuildContext context, state) {
                final cubit =
                    BlocProvider.of<CallMethodSelectorPageCubit>(context);
                return Row(
                  children: [
                    SelectorRect(
                      size: 160,
                      title: context.l10n.sms,
                      image: Icons.sms,
                      choosed: state.smsSelected,
                      onTap: () {
                        cubit.switchSelector(true);
                      },
                    ),
                    const SizedBox(width: 28),
                    SelectorRect(
                      size: 160,
                      title: context.l10n.phone_call,
                      image: Icons.call_outlined,
                      choosed: !state.smsSelected,
                      onTap: () {
                        cubit.switchSelector(false);
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WhiteButton(width: 162, onPressed: () {}),
                const SizedBox(width: 24),
                ActionButtonBlue(
                  width: 162,
                  isEnabled: true,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectorRect extends StatelessWidget {
  const SelectorRect({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.choosed,
    required this.size,
  }) : super(key: key);

  final IconData image;
  final String title;
  final VoidCallback onTap;

  final bool choosed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: choosed ? denim : lynch),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            if (choosed)
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(0, 3),
                color: Colors.black.withOpacity(0.3),
              )
          ],
        ),
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
