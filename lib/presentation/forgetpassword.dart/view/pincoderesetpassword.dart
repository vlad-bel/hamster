import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/forgetpassword.dart/cubit/forget_password_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamster_widgets/hamster_widgets.dart';

class PinCodePasswordResetPage extends StatelessWidget {
  final String email;
  final String type;
  const PinCodePasswordResetPage({
    Key? key,
    required this.email,
    required this.type,
  }) : super(key: key);
  static const path = '/pincoderesetpassword';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: PinCodePasswordResetView(email: email, type: type),
    );
  }
}

class PinCodePasswordResetView extends StatefulWidget {
  final String email;
  final String type;
  const PinCodePasswordResetView({
    Key? key,
    required this.email,
    required this.type,
  }) : super(key: key);

  @override
  State<PinCodePasswordResetView> createState() =>
      _PinCodePasswordResetViewState();
}

class _PinCodePasswordResetViewState extends State<PinCodePasswordResetView> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: tr('forget_pasword_header'),
          subHeader: RichText(
            text: TextSpan(
              style: inter14,
              text: tr('forget_password_email_inside_subtitle'),
              children: [
                TextSpan(
                  style: inter14Medium.copyWith(color: denim),
                  text: widget.email,
                ),
                TextSpan(
                  style: inter14,
                  text: tr('forget_password_email_inside_subtitle2'),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            ResetPasswordPinInput(
              email: widget.email,
              pinController: pinController,
              hasPinError: false,
            ),
            ResetCodeButton(email: widget.email, type: widget.type),
            SizedBox(height: 200),
            WhiteButton(
              width: 320,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPasswordPinInput extends StatelessWidget {
  final String email;
  const ResetPasswordPinInput({
    Key? key,
    required this.pinController,
    required this.hasPinError,
    required this.email,
  }) : super(key: key);

  final TextEditingController pinController;
  final bool hasPinError;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 8),
          child: Pincode(
            fieldCount: 5,
            width: 62,
            height: 87,
            controller: pinController,
            textStyle: HamsterStyles.pincodeWeb,
            hasError: state is WrongCode,
            onCompleted: (String value) {
              context.read<ForgetPasswordCubit>().verifyPhoneCode(value, email);
            },
          ),
        );
      },
    );
  }
}

class ResetCodeButton extends StatelessWidget {
  final String email;
  final String type;
  const ResetCodeButton({
    Key? key,
    required this.email,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.read<ForgetPasswordCubit>().resendSmsCode(email, type);
        },
        child: Text(
          tr('resetemail'),
          style: TextStyle(color: denim),
        ),
      ),
    );
  }
}
