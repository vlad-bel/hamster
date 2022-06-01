import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verification_method.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'package:business_terminal/presentation/forget_password/view/confirm_new_password_page.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hamster_widgets/hamster_widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PinCodePasswordResetPage extends StatelessWidget {
  final String email;
  final ForgetPasswordVerificationMethod method;

  const PinCodePasswordResetPage({
    super.key,
    required this.email,
    required this.method,
  });

  static const path = '/pincoderesetpassword';

  @override
  Widget build(BuildContext context) {
    return PinCodePasswordResetView(email: email, method: method);
  }
}

class PinCodePasswordResetView extends StatefulWidget {
  final String email;
  final ForgetPasswordVerificationMethod method;

  const PinCodePasswordResetView({
    super.key,
    required this.email,
    required this.method,
  });

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
          header: AppLocale.of(context).forget_password_header,
          subHeader: RichText(
            text: TextSpan(
              style: inter14,
              text: AppLocale.of(context).forgetpassword_email_subtitle,
              children: [
                TextSpan(
                  style: inter14Medium.copyWith(color: denim),
                  text: widget.email,
                ),
                TextSpan(
                  style: inter14,
                  text: AppLocale.of(context).forgetpassword_email_subtitle2,
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
            ResetCodeButton(email: widget.email, method: widget.method),
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
    super.key,
    required this.pinController,
    required this.hasPinError,
    required this.email,
  });

  final TextEditingController pinController;
  final bool hasPinError;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      bloc: GetIt.instance.get(),
      listener: (context, state) {
        state
          ..whenOrNull(
            verified: () {
              Navigator.of(context).pushNamed(ConfirmNewPasswordPage.path);
            },
            error: SnackBarManager.showError,
          )
          ..maybeWhen(
            loading: () => context.loaderOverlay.show(),
            orElse: () => context.loaderOverlay.hide(),
          );
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 8),
          child: Pincode(
            fieldCount: 5,
            width: 62,
            height: 87,
            controller: pinController,
            textStyle: HamsterStyles.pincodeWeb,
            hasError:
                state.maybeMap(wrongCode: (_) => true, orElse: () => false),
            onCompleted: (String value) {
              context.read<ForgetPasswordCubit>().confirmCode(value, email);
            },
          ),
        );
      },
    );
  }
}

class ResetCodeButton extends StatelessWidget {
  final String email;
  final ForgetPasswordVerificationMethod method;

  const ResetCodeButton({
    super.key,
    required this.email,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.read<ForgetPasswordCubit>().resendSmsCode(email, method);
        },
        child: Text(
          AppLocale.of(context).reset_email,
          style: TextStyle(color: denim),
        ),
      ),
    );
  }
}
