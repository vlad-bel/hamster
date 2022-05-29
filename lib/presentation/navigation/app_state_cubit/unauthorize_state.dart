import 'package:business_terminal/presentation/add_opening_hours/view/add_opening_hours_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:flutter/material.dart';

String emailParam = 'email';
String phoneNumberParam = 'phone_number';
String verifyMethodParam = 'verify_method';

class UnauthorizedState extends AppState {
  UnauthorizedState({
    required super.initialRoute,
  }) : super(
          onGenerateRoute: (routeSettings) {
            final pages = AddOpeningHoursPage();
            return PageRouteBuilder<void>(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              pageBuilder: (context, anim1, anim2) {
                return pages;
              },
              settings: routeSettings,
            );
          },
        );
}
