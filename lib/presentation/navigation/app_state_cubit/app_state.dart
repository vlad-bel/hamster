import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    BlocProvider.of<AppStateCubit>(context).goToAuthZone(DashboardPage.path);
    // Navigator.of(context).pushNamed("/dashboard");
    print(
        "currentState: ${BlocProvider.of<AppStateCubit>(context).state.runtimeType}");
  }

  static void _goToCompanyCreation(BuildContext context) {
    BlocProvider.of<AppStateCubit>(context).goToAuthZone(
      CompanyCreationPage.path,
    );
    // Navigator.of(context).pushNamed(CompanyCreationPage.path);
  }
}

@immutable
abstract class AppState extends Equatable {
  static RegistrationNavigationFlow flowType =
      RegistrationNavigationFlow.shouldGoFromLoginToDashboard;

  final String initialRoute;
  final RouteFactory? onGenerateRoute;

  const AppState({
    required this.initialRoute,
    required this.onGenerateRoute,
  });

  // Route generateRoute(RouteSettings settings);

  @override
  List<Object?> get props => [
        initialRoute,
        onGenerateRoute,
      ];
}
