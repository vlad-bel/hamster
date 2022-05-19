import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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


  @override
  List<Object?> get props => [
        initialRoute,
        onGenerateRoute,
      ];
}
