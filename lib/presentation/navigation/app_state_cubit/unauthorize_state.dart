import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/app/utils/storage/storage_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/request_model/otp_verification/phone_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/forget_password/view/choose_verify_page.dart';
import 'package:business_terminal/presentation/forget_password/view/confirm_new_password_page.dart';
import 'package:business_terminal/presentation/forget_password/view/forget_password_email.dart';
import 'package:business_terminal/presentation/forget_password/view/new_password_installed_page.dart';
import 'package:business_terminal/presentation/forget_password/view/pincode_reset_password.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/nav_utils.dart';
import 'package:business_terminal/presentation/navigation/unknown_page.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmaion_page.dart';
import 'package:business_terminal/presentation/number_verification/result_page/result_page.dart';
import 'package:business_terminal/presentation/otp_verification/view/otp_verification_page.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:flutter/material.dart';

String emailParam = 'email';
String phoneNumberParam = 'phone_number';
String verifyMethodParam = 'verify_method';

class UnauthorizedState extends AppState {
  UnauthorizedState({
    required super.initialRoute,
  }) : super(
          onGenerateRoute: (routeSettings) {
            Widget page;
            final params = routeSettings.arguments as Map<String, dynamic>?;
            switch (routeSettings.name) {
              case LoginPage.path:
                page = const LoginPage();
                break;
              case RegistrationPage.path:
                page = const RegistrationPage();
                break;
              case EmailVerificationPage.path:
                if (params?[emailParam] != null) {
                  final email = params![emailParam]! as String;
                  appStorageService.setString(
                    key: emailParam,
                    value: email,
                  );
                }

                page = buildPage(
                  requiredParams: [emailParam],
                  child: EmailVerificationPage(
                    model: VerificationModel(
                      userCredentials:
                          appStorageService.getString(key: emailParam),
                      title: AppLocale.current.confirm_email_title,
                      wrongOtpText: AppLocale.current.otpCodeIncorrect,
                      otpSentText: AppLocale.current.emailSentDescription,
                      previousEmailText: AppLocale
                          .current.forget_password_email_inside_subtitle,
                      previousEmailSpamText: AppLocale
                          .current.forget_password_email_inside_subtitle2,
                    ),
                  ),
                );
                break;
              case CountryCodePage.path:
                page = buildPage(
                  requiredParams: [emailParam],
                  child: CountryCodePage(
                    email: appStorageService.getString(key: emailParam)!,
                  ),
                );
                break;
              case CallMethodSelectorPage.path:
                if (params?[phoneNumberParam] != null) {
                  final phone = params![phoneNumberParam]! as String;
                  appStorageService.setString(
                    key: phoneNumberParam,
                    value: phone,
                  );
                }

                page = buildPage(
                  requiredParams: [
                    phoneNumberParam,
                    emailParam,
                  ],
                  child: CallMethodSelectorPage(
                    phoneNumber:
                        appStorageService.getString(key: phoneNumberParam)!,
                    email: appStorageService.getString(key: emailParam)!,
                  ),
                );
                break;
              case NumberCodeConfirmationPage.path:
                if (params?[verifyMethodParam] != null) {
                  final verifyMethod = VerifyMethodExtension.fromString(
                    params![verifyMethodParam]! as String,
                  );
                  appStorageService.setString(
                    key: verifyMethodParam,
                    value: verifyMethod.string,
                  );
                }

                page = buildPage(
                  requiredParams: [
                    phoneNumberParam,
                    emailParam,
                    verifyMethodParam,
                  ],
                  child: NumberCodeConfirmationPage(
                    phone: appStorageService.getString(key: phoneNumberParam)!,
                    email: appStorageService.getString(key: emailParam)!,
                    verificationMethod: VerifyMethodExtension.fromString(
                      appStorageService.getString(key: verifyMethodParam)!,
                    ),
                  ),
                );
                break;
              case PhoneVerificationResultPage.path:
                page = const PhoneVerificationResultPage();
                break;
              case ForgetPasswordEmailPage.path:
                page = const ForgetPasswordEmailPage();
                break;

              case ChooseVerifyPage.path:
                if (params != null) {
                  ChooseVerifyPage.saveParams(appStorageService, params);
                }
                page = ChooseVerifyPage.fromStorage(appStorageService);
                break;
              case PinCodePasswordResetPage.path:
                if (params != null) {
                  PinCodePasswordResetPage.saveParams(
                      appStorageService, params);
                }
                page = PinCodePasswordResetPage.fromStorage(appStorageService);
                break;
              case ConfirmNewPasswordPage.path:
                page = const ConfirmNewPasswordPage();
                break;

              case NewPasswordInstalledPage.path:
                page = const NewPasswordInstalledPage();
                break;

              default:
                page = UnknownPage(
                  path: routeSettings.name ?? 'unknown path',
                );
            }

            return PageRouteBuilder<void>(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              pageBuilder: (context, anim1, anim2) {
                return page;
              },
              settings: routeSettings,
            );
          },
        );

  static final appStorageService = getIt.get<AppStorageService>();
}
