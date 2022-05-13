import 'dart:html';

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
  for (var i = 0; i < requiredParams.length; i++) {
    if (!window.sessionStorage.keys.contains(requiredParams[i])) {
      return false;
    }
  }

  return true;
}
