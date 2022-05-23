import 'package:business_terminal/app/utils/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppLocale {
  const AppLocale();

  static S get current {
    return S.current;
  }

  static S of(BuildContext context) {
    return S.of(context);
  }
}
