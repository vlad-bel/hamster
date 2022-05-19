import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';

class AuthorizedState extends AppState {
  AuthorizedState({
    required String initialRoute,
  }) : super(
          initialRoute: initialRoute,
          onGenerateRoute: (RouteSettings settings) {
            late Widget page;
            final params = settings.arguments as Map<String, dynamic>?;
            switch (settings.name) {
              case CompanyCreationPage.path:
                page = const CompanyCreationPage();
                break;

              case DashboardPage.path:
                page = const DashboardPage(
                  initialPagePath: accountVerificationPath,
                  initialPageIndex: 1,
                );
                break;
            }

            return PageRouteBuilder<void>(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              pageBuilder: (context, anim1, anim2) {
                return page;
              },
              settings: settings,
            );
          },
        );
}
