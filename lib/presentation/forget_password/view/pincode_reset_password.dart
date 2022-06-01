import 'package:business_terminal/app/utils/enum_utils.dart';
import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/app/utils/storage/storage_service.dart';
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
  static const _kEmailKey = '$path/email';
  static const _kMethodKey = '$path/method';

  static const path = '/pincode_reset_password';

  final String email;
  final ForgetPasswordVerificationMethod method;

  const PinCodePasswordResetPage({
    super.key,
    required this.email,
    required this.method,
  });

  static Map<String, dynamic> buildParams(
    String email,
    ForgetPasswordVerificationMethod method,
  ) =>
      {_kEmailKey: email, _kMethodKey: method};

  static void saveParams(
      AppStorageService service, Map<String, dynamic> params) {
    service
      ..setString(
        key: _kMethodKey,
        value: (params[_kMethodKey] as ForgetPasswordVerificationMethod)
            .toString(),
      )
      ..setString(key: _kEmailKey, value: params[_kEmailKey].toString());
  }

  factory PinCodePasswordResetPage.fromStorage(AppStorageService service) {
    return PinCodePasswordResetPage(
      email: service.getString(key: _kEmailKey)!,
      method: enumFromString(ForgetPasswordVerificationMethod.values,
          service.getString(key: _kMethodKey)!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _PinCodePasswordResetView(email: email, method: method);
  }
}

class _PinCodePasswordResetView extends StatefulWidget {
  final String email;
  final ForgetPasswordVerificationMethod method;

  const _PinCodePasswordResetView({
    super.key,
    required this.email,
    required this.method,
  });

  @override
  State<_PinCodePasswordResetView> createState() =>
      _PinCodePasswordResetViewState();
}

class _PinCodePasswordResetViewState extends State<_PinCodePasswordResetView> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).forget_password_header,
          subHeader: _getSubtitle(),
        ),
        body: Column(
          children: [
            _ResetPasswordPinInput(
              email: widget.email,
              pinController: pinController,
              hasPinError: false,
            ),
            _ResetCodeButton(email: widget.email, method: widget.method),
            const SizedBox(
              height: 150,
              child: Center(child: _CodeStatusWidget()),
            ),
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

  Widget _getSubtitle() {
    final phone = context.read<ForgetPasswordCubit>().state.mapOrNull(
          sent: (state) => state.phoneNumber,
          wrongCode: (state) => state.phoneNumber,
        );
    switch (widget.method) {
      case ForgetPasswordVerificationMethod.phoneCall:
        return _getPhoneCallSubtitle(phone);
      case ForgetPasswordVerificationMethod.sms:
        return _getSmsSubtitle(phone);
      case ForgetPasswordVerificationMethod.email:
        return _getEmailSubtitle();
    }
  }

  Widget _getPhoneCallSubtitle(String? phoneNumber) => RichText(
        text: TextSpan(
          style: inter14,
          text: AppLocale.of(context).forgetPasswordPhoneCallSubtitle1,
          children: [
            TextSpan(
              style: inter14Medium.copyWith(color: denim),
              text: phoneNumber,
            ),
            TextSpan(
              style: inter14,
              text: AppLocale.of(context).forgetPasswordPhoneCallSubtitle2,
            ),
          ],
        ),
      );

  Widget _getSmsSubtitle(String? phoneNumber) => RichText(
        text: TextSpan(
          style: inter14,
          text: AppLocale.of(context).forgetPasswordSmsSubtitle1,
          children: [
            TextSpan(
              style: inter14Medium.copyWith(color: denim),
              text: phoneNumber,
            ),
            TextSpan(
              style: inter14,
              text: AppLocale.of(context).forgetPasswordSmsSubtitle2,
            ),
          ],
        ),
      );

  Widget _getEmailSubtitle() => RichText(
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
      );
}

class _ResetPasswordPinInput extends StatelessWidget {
  final String email;

  const _ResetPasswordPinInput({
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

class _ResetCodeButton extends StatelessWidget {
  final String email;
  final ForgetPasswordVerificationMethod method;

  const _ResetCodeButton({
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
          _getButtonText(context),
          style: const TextStyle(color: denim),
        ),
      ),
    );
  }

  String _getButtonText(BuildContext context) {
    switch (method) {
      case ForgetPasswordVerificationMethod.phoneCall:
        return AppLocale.of(context).resetPhoneCall;
      case ForgetPasswordVerificationMethod.sms:
        return AppLocale.of(context).resetSms;
      case ForgetPasswordVerificationMethod.email:
        return AppLocale.of(context).resetEmail;
    }
  }
}

class _CodeStatusWidget extends StatelessWidget {
  const _CodeStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        return state.maybeMap(
          resent: (state) => _getCodeResentMessage(context, state.method),
          wrongCode: (state) => _getIncorrectCodeMessage(context),
          orElse: SizedBox.shrink,
        );
      },
    );
  }

  Widget _getCodeResentMessage(
    BuildContext context,
    ForgetPasswordVerificationMethod method,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.send, size: 22, color: fruitSalad),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              _getCodeResentText(context, method),
              style: inter16.copyWith(color: fruitSalad),
            ),
          )
        ],
      );

  String _getCodeResentText(
    BuildContext context,
    ForgetPasswordVerificationMethod method,
  ) {
    switch (method) {
      case ForgetPasswordVerificationMethod.email:
        return AppLocale.of(context).emailCodeSent;
      case ForgetPasswordVerificationMethod.phoneCall:
        return AppLocale.of(context).callIsOrdered;
      case ForgetPasswordVerificationMethod.sms:
        return AppLocale.of(context).smsResent;
    }
  }

  Widget _getIncorrectCodeMessage(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 22, color: razzmatazz),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              AppLocale.of(context).forgetPasswordCodeIncorrect,
              style: inter16.copyWith(color: razzmatazz),
            ),
          )
        ],
      );
}
