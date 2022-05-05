import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/test_page/dashboard_testpage.dart';
import 'package:business_terminal/presentation/email_verification/view/email_verification_page.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/navigation/hamster_page.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmaion_page.dart';
import 'package:business_terminal/presentation/number_verification/result_page/result_page.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final tabBarPageKey = GlobalKey();

class AuthRouteMap extends RouteMap {
  AuthRouteMap()
      : super(
          onUnknownRoute: _onUnknownRoute,
          routes: _routes,
        );

  static RouteSettings _onUnknownRoute(String route) => const Redirect('/');

  static final Map<String, PageBuilder> _routes = {
    // '/': (_) => TabPage(
    //       pageBuilder: (child) => HamsterPage<void>(child: child),
    //       child: DashboardPage(
    //         initialTabPage: 0,
    //         key: tabBarPageKey,
    //       ),
    //       paths: const [
    //         '/finance/finance1',
    //         '/administration/account-verification',
    //         '/administration/my-company',
    //         '/administration/user-management',
    //       ],
    //     ),
    // '/administration/account-verification': (data) {
    //   return HamsterPage<void>(
    //     child: Container(
    //       color: solitude1,
    //       child: Center(
    //         child: Text(data.path),
    //       ),
    //     ),
    //   );
    // },
    // '/finance/finance1': (data) {
    //   return HamsterPage<void>(
    //     child: Container(
    //       color: solitude1,
    //       child: Center(
    //         child: Text(data.path),
    //       ),
    //     ),
    //   );
    // },
    // '/administration/my-company': (data) {
    //   return const HamsterPage<void>(
    //     child: DashboardTestPage(),
    //   );
    // },
    // '/administration/user-management': (data) {
    //   return HamsterPage<void>(
    //     child: Container(
    //       color: solitude1,
    //       child: Center(
    //         child: Text(data.path),
    //       ),
    //     ),
    //   );
    // },
    LoginPage.path: (_) => const HamsterPage<void>(
          child: LoginPage(),
        ),
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
