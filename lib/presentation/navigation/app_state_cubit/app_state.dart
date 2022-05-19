import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum RegistrationNavigationFlow {
  shouldGoFromLoginToDashboard,
  shouldGoFromLoginToCompanyCreation
}

abstract class RegistrationFlowManager {
  static void shouldGoFromLoginToDashboard() {
    AppState.flowType = RegistrationNavigationFlow.shouldGoFromLoginToDashboard;
  }

  static void shouldGoFromLoginToCompanyCreation() {
    AppState.flowType =
        RegistrationNavigationFlow.shouldGoFromLoginToCompanyCreation;
  }

  static void navigateToNextScreenFromLogin(BuildContext context) {
    switch (AppState.flowType) {
      case RegistrationNavigationFlow.shouldGoFromLoginToDashboard:
        _goToDashboard(context);
        break;
      case RegistrationNavigationFlow.shouldGoFromLoginToCompanyCreation:
        _goToCompanyCreation(context);
        break;
    }
  }

  static void _goToDashboard(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(DashboardPage.path);
  }

  static void _goToCompanyCreation(BuildContext context) {
    Navigator.of(context).pushNamed(CompanyCreationPage.path);
  }
}

@immutable
abstract class AppState extends Equatable {
  static RegistrationNavigationFlow flowType =
      RegistrationNavigationFlow.shouldGoFromLoginToDashboard;

  final String initialRoute;

  const AppState({
    required this.initialRoute,
  });

  Route generateRoute(RouteSettings settings);

  @override
  List<Object?> get props => [
        initialRoute,
      ];
}