import 'package:business_terminal/app/utils/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@singleton
class AppLocale {
  const AppLocale();

  static S get current {
    return S.current;
  }

  static AppLocalizationDelegate get delegate {
    return S.delegate;
  }

  static S of(BuildContext context) {
    return S.of(context);
  }

  static String byKey(String key) {
    return Intl.message(
      'error #69',
      name: key,
    );
  }
}
