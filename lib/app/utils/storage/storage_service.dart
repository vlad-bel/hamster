import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AppStorageService {
  final SharedPreferences prefs;

  AppStorageService(this.prefs);

  Future<bool> remove({
    required String key,
  }) async {
    return prefs.remove(key);
  }

  bool containsKey({required String key}) {
    return prefs.containsKey(key);
  }

  int? getInt({
    required String key,
  }) {
    return prefs.getInt(key);
  }

  bool? getBool({
    required String key,
  }) {
    return prefs.getBool(key);
  }

  double? getDouble({
    required String key,
  }) {
    return prefs.getDouble(key);
  }

  String? getString({
    required String key,
  }) {
    return prefs.getString(key);
  }

  List<String>? getStringList({
    required String key,
  }) {
    return prefs.getStringList(key);
  }

  Future<bool> setInt({
    required String key,
    required int value,
  }) async {
    return prefs.setInt(key, value);
  }

  Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    return prefs.setBool(key, value);
  }

  Future<bool> setDouble({
    required String key,
    required double value,
  }) async {
    return prefs.setDouble(key, value);
  }

  Future<bool> setString({
    required String key,
    required String value,
  }) async {
    return prefs.setString(key, value);
  }

  Future<bool> setStringList({
    required String key,
    required List<String> value,
  }) async {
    return prefs.setStringList(key, value);
  }
}
