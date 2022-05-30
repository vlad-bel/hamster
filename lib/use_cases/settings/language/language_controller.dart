import 'package:business_terminal/app/utils/storage/storage_service.dart';
import 'package:business_terminal/config/app_storage_keys.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_appbar/model/app_language_model.dart';
import 'package:business_terminal/use_cases/settings/language/language_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocaleSettingsController with ChangeNotifier {
  LocaleSettingsController(this._service) {
    loadSettings();
  }

  late Locale _locale;
  final LocaleSettingsService _service;

  Locale get locale => _locale;

  List<AppLanguageModel> getLanguages() {
    return _service.getLanguages();
  }

  void loadSettings() {
    _locale = _service.locale();

    notifyListeners();
  }

  Future<void> updateLocale(Locale? newLocale) async {
    if (newLocale == null || newLocale == _locale) return;

    await AppStorageService().setString(
      key: AppStorageKeys.languageCode,
      value: '$newLocale',
    );
    _locale = newLocale;
    notifyListeners();
  }
}
