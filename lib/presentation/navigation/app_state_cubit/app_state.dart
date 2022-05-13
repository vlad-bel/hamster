import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppState extends Equatable {
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