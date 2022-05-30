import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorageService {
  final _prefs = GetIt.I<SharedPreferences>();

  Future<bool> remove({
    required String key,
  }) async {
    return _prefs.remove(key);
  }

  int? getInt({
    required String key,
  }) {
    return _prefs.getInt(key);
  }

  bool? getBool({
    required String key,
  }) {
    return _prefs.getBool(key);
  }

  double? getDouble({
    required String key,
  }) {
    return _prefs.getDouble(key);
  }

  String? getString({
    required String key,
  }) {
    return _prefs.getString(key);
  }

  List<String>? getStringList({
    required String key,
  }) {
    return _prefs.getStringList(key);
  }

  Future<bool> setInt({
    required String key,
    required int value,
  }) async {
    return _prefs.setInt(key, value);
  }

  Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    return _prefs.setBool(key, value);
  }

  Future<bool> setDouble({
    required String key,
    required double value,
  }) async {
    return _prefs.setDouble(key, value);
  }

  Future<bool> setString({
    required String key,
    required String value,
  }) async {
    return _prefs.setString(key, value);
  }

  Future<bool> setStringList({
    required String key,
    required List<String> value,
  }) async {
    return _prefs.setStringList(key, value);
  }
}
