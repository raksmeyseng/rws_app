import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService._internal();
  static final LocalStorageService _instance = LocalStorageService._internal();
  static LocalStorageService get instance => _instance;

  SharedPreferences? _prefs;
  Future<SharedPreferences> _getPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
      return _prefs!;
    }
    return _prefs!;
  }

  Future<bool> saveString(String key, String value) async {
    final prefs = await _getPrefs();
    return prefs.setString(key, value);
  }

  Future<bool> saveInt(String key, int value) async {
    final prefs = await _getPrefs();
    return prefs.setInt(key, value);
  }

  Future<bool> saveBool(String key, bool value) async {
    final prefs = await _getPrefs();
    return prefs.setBool(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _getPrefs();
    return prefs.getString(key);
  }

  Future<int?> getInt(String key) async {
    final prefs = await _getPrefs();
    return prefs.getInt(key);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await _getPrefs();
    return prefs.getBool(key);
  }

  Future<bool> remove(String key) async {
    final prefs = await _getPrefs();
    return prefs.remove(key);
  }

  Future<bool> clearAll() async {
    final prefs = await _getPrefs();
    return prefs.clear();
  }
}
