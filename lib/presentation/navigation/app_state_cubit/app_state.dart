import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppState extends Equatable {
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
