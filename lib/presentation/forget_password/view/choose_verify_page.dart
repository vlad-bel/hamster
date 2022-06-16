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
import 'package:business_terminal/presentation/forget_password/view/pincode_reset_password.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_form.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

/// Mockup - [https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/0bc92cbb-b689-4d76-9b49-b1f74978e656/]
class ChooseVerifyPage extends StatelessWidget {
  static const path = '/choose_verify_page';
  static const _kEmailKey = '$path/email';

  const ChooseVerifyPage._({super.key, required this.email});

  /// Build params to pass them to this page later
  static Map<String, dynamic> buildParams(String email) => {_kEmailKey: email};

  /// Save params to restore them in case of page reloading
  static void saveParams(
      AppStorageService service, Map<String, dynamic> params) {
    service.setString(key: _kEmailKey, value: params[_kEmailKey] as String);
  }

  factory ChooseVerifyPage.fromStorage(AppStorageService service, {Key? key}) =>
      ChooseVerifyPage._(key: key, email: service.getString(key: _kEmailKey)!);

  final String email;

  @override
  Widget build(BuildContext context) {
    return _ChooseVerifyView(
      email: email,
    );
  }
}

class _ChooseVerifyView extends StatelessWidget {
  final String email;

  const _ChooseVerifyView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state
          ..whenOrNull(
            sent: (type, _) => _onPressNavigateToPinCodePage(
              context,
              email,
              type,
            ),
            error: SnackBarManager.showError,
          )
          ..maybeWhen(
            loading: () => context.loaderOverlay.show(),
            orElse: () => context.loaderOverlay.hide(),
          );
      },
      builder: (context, state) {
        return OnboardingBackground(
          children: OnboardingWhiteContainer(
            header: OnboardingWhiteContainerHeader(
              header: AppLocale.of(context).forget_password,
              subHeader: SubHeaderEmailRichText(
                email: email,
              ),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    SelectorRect(
                      size: 110,
                      title: AppLocale.of(context).email,
                      icon: Icons.email,
                      onTap: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .chooseTypeOfVerification(
                              ForgetPasswordVerificationMethod.email,
                            );
                      },
                      choosed: state.maybeMap(
                        chosen: (state) =>
                            state.method ==
                            ForgetPasswordVerificationMethod.email,
                        orElse: () => false,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SelectorRect(
                      size: 110,
                      title: AppLocale.of(context).sms,
                      icon: Icons.sms,
                      onTap: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .chooseTypeOfVerification(
                                ForgetPasswordVerificationMethod.sms);
                      },
                      choosed: state.maybeMap(
                        chosen: (state) =>
                            state.method ==
                            ForgetPasswordVerificationMethod.sms,
                        orElse: () => false,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SelectorRect(
                      size: 110,
                      title: AppLocale.of(context).phone_call,
                      icon: Icons.call_outlined,
                      onTap: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .chooseTypeOfVerification(
                                ForgetPasswordVerificationMethod.phoneCall);
                      },
                      choosed: state.maybeMap(
                        chosen: (state) =>
                            state.method ==
                            ForgetPasswordVerificationMethod.phoneCall,
                        orElse: () => false,
                      ),
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
                      isEnabled: state.maybeMap(
                        chosen: (_) => true,
                        orElse: () => false,
                      ),
                      onPressed: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .sendVerificationCode(email);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SubHeaderEmailRichText extends StatelessWidget {
  final String email;

  const SubHeaderEmailRichText({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppLocale.of(context).forgetpassword_email_subtitle,
        style: inter14.copyWith(height: 1.6),
        children: [
          TextSpan(
            text: email,
            style: inter14.copyWith(color: denim),
          ),
          TextSpan(
            text: AppLocale.of(context).forgetpassword_email_subtitle2,
            style: inter14,
          ),
        ],
      ),
    );
  }
}

void _onPressNavigateToPinCodePage(
  BuildContext context,
  String email,
  ForgetPasswordVerificationMethod method,
) {
  Navigator.of(context).pushNamed(
    PinCodePasswordResetPage.path,
    arguments: PinCodePasswordResetPage.buildParams(email, method),
  );
}
