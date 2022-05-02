import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/navigation/hamster_page.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmaion_page.dart';
import 'package:business_terminal/presentation/number_verification/result_page/result_page.dart';
import 'package:business_terminal/presentation/registration/email_verification/view/email_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../registration/view/registration_page.dart';

class AuthRouteMap extends RouteMap {
  AuthRouteMap()
      : super(
          onUnknownRoute: _onUnknownRoute,
          routes: _routes,
        );

  static RouteSettings _onUnknownRoute(String route) => const Redirect('/');

  static final Map<String, PageBuilder> _routes = {
    RegistrationPage.path: (_) => const HamsterPage<void>(
          child: RegistrationPage(),
        ),
    EmailVerificationPage.path: (data) {
      final email = data.queryParameters['email']!;
      return HamsterPage<void>(
        child: EmailVerificationPage(
          userEmail: email,
        ),
      );
    },
    CountriesCodePage.path: (data) {
      final email = data.queryParameters['email']!;
      return HamsterPage<String>(
        child: CountriesCodePage(
          email: email,
          // email: "ass@hole.com",
        ),
      );
    },
    CallMethodSelectorPage.path: (data) {
      final phoneNumber = data.queryParameters['phone_number']!;
      final email = data.queryParameters['email']!;

      return HamsterPage<void>(
        child: CallMethodSelectorPage(
          phoneNumber: phoneNumber,
          email: email,
        ),
      );
    },
    NumberCodeConfirmationPage.path: (data) {
      final phoneNumber = data.queryParameters['phone']!;
      final email = data.queryParameters['email']!;
      final method = VerifyMethodExtension.fromString(
        data.queryParameters['verify_method']!,
      );
      return HamsterPage<void>(
        child: NumberCodeConfirmationPage(
          email: email,
          phone: phoneNumber,
          verifyMethod: method,
        ),
      );
    },
    ResultPage.path: (data) {
      return const HamsterPage<void>(
        child: ResultPage(),
          verificationMethod: method,
        ),
      );
    },
    PhoneVerificationResultPage.path: (data) {
      return const HamsterPage<void>(
        child: PhoneVerificationResultPage(),
      );
    }
  };
}
