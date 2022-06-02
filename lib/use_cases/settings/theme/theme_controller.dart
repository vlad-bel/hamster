import 'package:business_terminal/use_cases/settings/theme/theme_service.dart';
import 'package:flutter/material.dart';

class ThemeSettingsController with ChangeNotifier {
  ThemeSettingsController(this._settingsService) {
    loadSettings();
  }

  final ThemeSettingsService _settingsService;
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  void loadSettings() {
    _themeMode = _settingsService.themeMode();

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }
}
