import 'dart:html';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/email_verification/view/email_verification_page.dart';
import 'package:business_terminal/presentation/forgetpassword.dart/view/chooseverifypage.dart';
import 'package:business_terminal/presentation/forgetpassword.dart/view/forgetpassword_email.dart';
import 'package:business_terminal/presentation/forgetpassword.dart/view/pincoderesetpassword.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/nav_utils.dart';
import 'package:business_terminal/presentation/navigation/unknown_page.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmaion_page.dart';
import 'package:business_terminal/presentation/number_verification/result_page/result_page.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:flutter/material.dart';

String emailParam = 'email';
String phoneNumberParam = 'phone_number';
String verifyMethodParam = 'verify_method';

class UnauthorizedState extends AppState {
  UnauthorizedState({
    required String initialRoute,
  }) : super(
          initialRoute: initialRoute,
        );

  @override
  Route generateRoute(RouteSettings routeSettings) {
    late Widget page;
    final params = routeSettings.arguments as Map<String, dynamic>?;
    switch (routeSettings.name) {
      case LoginPage.path:
        page = const LoginPage();
        break;

      case ForgetPasswordEmailPage.path:
        page = const ForgetPasswordEmailPage();
        break;

      case ChooseVerifyPage.path:
        final email = params!['email'] as String;
        page = ChooseVerifyPage(
          email: email,
        );
        break;
      case PinCodePasswordResetPage.path:
        final email = params!['email'] as String;
        final type = params['type'] as String;
        page = PinCodePasswordResetPage(email: email, type: type);
        break;
      case RegistrationPage.path:
        page = const RegistrationPage();
        break;
      case EmailVerificationPage.path:
        if (params?[emailParam] != null) {
          final email = params![emailParam]! as String;
          window.sessionStorage[emailParam] = email;
        }

        page = buildPage(
          requiredParams: [emailParam],
          child: EmailVerificationPage(
            userEmail: window.sessionStorage[emailParam],
          ),
        );
        break;
      case CountriesCodePage.path:
        page = buildPage(
          requiredParams: [emailParam],
          child: CountriesCodePage(
            email: window.sessionStorage[emailParam]!,
          ),
        );
        break;
      case CallMethodSelectorPage.path:
        if (params?[phoneNumberParam] != null) {
          final phone = params![phoneNumberParam]! as String;
          window.sessionStorage[phoneNumberParam] = phone;
        }

        page = buildPage(
          requiredParams: [
            phoneNumberParam,
            emailParam,
          ],
          child: CallMethodSelectorPage(
            phoneNumber: window.sessionStorage[phoneNumberParam]!,
            email: window.sessionStorage[emailParam]!,
          ),
        );
        break;
      case NumberCodeConfirmationPage.path:
        if (params?[verifyMethodParam] != null) {
          final verifyMethod = VerifyMethodExtension.fromString(
            params![verifyMethodParam]! as String,
          );

          window.sessionStorage[verifyMethodParam] = verifyMethod.string;
        }

        page = buildPage(
          requiredParams: [
            phoneNumberParam,
            emailParam,
            verifyMethodParam,
          ],
          child: NumberCodeConfirmationPage(
            phone: window.sessionStorage[phoneNumberParam]!,
            email: window.sessionStorage[emailParam]!,
            verificationMethod: VerifyMethodExtension.fromString(
              window.sessionStorage[verifyMethodParam]!,
            ),
          ),
        );
        break;
      case PhoneVerificationResultPage.path:
        page = const PhoneVerificationResultPage();
        break;
      case DashboardPage.path:
        page = const DashboardPage(
          initialPagePath: accountVerificationPath,
          initialPageIndex: 1,
        );
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
  }
}
