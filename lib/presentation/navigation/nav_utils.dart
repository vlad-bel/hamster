import 'package:business_terminal/app/utils/storage/storage_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/navigation/error_page.dart';
import 'package:flutter/material.dart';

Widget buildPage({
  required List<String> requiredParams,
  required Widget child,
}) {
  if (checkRequiredParams(requiredParams: requiredParams)) {
    return child;
  }
  return ErrorPage(
    missingParams: requiredParams,
  );
}

bool checkRequiredParams({
  required List<String> requiredParams,
}) {
  final appStorageService = getIt.get<AppStorageService>();

  for (var i = 0; i < requiredParams.length; i++) {
    if (!appStorageService.containsKey(key: requiredParams[i])) {
      return false;
    }
  }

  return true;
}
