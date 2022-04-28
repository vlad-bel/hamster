import 'package:business_terminal/presentation/navigation/hamster_page.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class AuthRouteMap extends RouteMap {
  AuthRouteMap()
      : super(
          onUnknownRoute: _onUnknownRoute,
          routes: _routes,
        );

  static RouteSettings _onUnknownRoute(String route) => const Redirect('/');

  static final Map<String, PageBuilder> _routes = {
    CountriesCodePage.path: (_) => const HamsterPage<String>(
          child: CountriesCodePage(),
        ),
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
      final phoneNumber = data.queryParameters['phone_number']!;
      final email = data.queryParameters['email']!;

      return HamsterPage<void>(
        child: NumberCodeConfirmationPage(
          email: email,
          phone: phoneNumber,
        ),
      );
    },
  };
}
