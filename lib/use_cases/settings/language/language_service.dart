import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/app/utils/storage/storage_service.dart';
import 'package:business_terminal/config/app_storage_keys.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_appbar/model/app_language_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocaleSettingsService {
  Locale locale() {
    final languageCode = AppStorageService().getString(
      key: AppStorageKeys.languageCode,
    );
    if (languageCode != null) {
      return Locale.fromSubtags(
        languageCode: languageCode,
      );
    }
    return Locale('de');
  }

  List<AppLanguageModel> getLanguages() {
    return AppLocale.delegate.supportedLocales.map((value) {
      switch (value.languageCode) {
        case 'en':
          return AppLanguageModel(
            value.languageCode,
            'English',
            Assets.flagsGer, // TODO Add eng flag
          );
        case 'de':
          return AppLanguageModel(
            value.languageCode,
            'Deutsch',
            Assets.flagsGer,
          );
        default:
          return AppLanguageModel(
            'de',
            'Deutsch',
            Assets.flagsGer,
          );
      }
    }).toList();
  }
}
