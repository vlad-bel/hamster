import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_state.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmaion_page.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallMethodSelectorForm extends StatefulWidget {
  const CallMethodSelectorForm({
    Key? key,
    required this.number,
    required this.email,
  }) : super(key: key);

  final String number;
  final String email;

  @override
  State<CallMethodSelectorForm> createState() => _CallMethodSelectorFormState();
}

class _CallMethodSelectorFormState extends State<CallMethodSelectorForm> {
  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: tr('confirm_number_title'),
          subHeader: RichText(
            text: TextSpan(
              style: inter14,
              text: tr('call_method1'),
              children: [
                TextSpan(
                  style: inter14Medium.copyWith(color: denim),
                  text: '+${widget.number}',
                ),
                TextSpan(
                  style: inter14,
                  text: tr('call_method2'),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<CallMethodSelectorPageCubit,
            CallMethodSelectorPageState>(
          builder: (BuildContext context, state) {
            final cubit = BlocProvider.of<CallMethodSelectorPageCubit>(context);
            return Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    SelectorRect(
                      size: 160,
                      title: tr('sms'),
                      icon: Icons.sms,
                      choosed: state.smsSelected,
                      onTap: () {
                        cubit.switchSelector(true);
                      },
                    ),
                    const SizedBox(width: 28),
                    SelectorRect(
                      size: 160,
                      title: tr('phone_call'),
                      icon: Icons.call_outlined,
                      choosed: !state.smsSelected,
                      onTap: () {
                        cubit.switchSelector(false);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WhiteButton(
                      width: 162,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 24),
                    ActionButtonBlue(
                      width: 162,
                      isEnabled: true,
                      onPressed: () {
                        cubit.sendCallMethod(
                          email: widget.email,
                        );
                        final verificationMethod = state.smsSelected
                            ? VerifyMethod.sms
                            : VerifyMethod.phoneCall;
                        Navigator.of(context).pushNamed(
                          NumberCodeConfirmationPage.path,
                          arguments: {
                            phoneNumberParam: widget.number,
                            emailParam: widget.email,
                            verifyMethodParam: verificationMethod.string,
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SelectorRect extends StatelessWidget {
  const SelectorRect({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.choosed,
    required this.size,
  }) : super(key: key);

  final IconData icon;
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
              icon,
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
