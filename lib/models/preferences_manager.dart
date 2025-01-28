import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  // متغیری برای نگهداری شیء SharedPreferences
  static SharedPreferences? _preferences;

  // مقداردهی اولیه شیء SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // ذخیره رشته‌ای در SharedPreferences
  static Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // دریافت رشته‌ای از SharedPreferences
  static String? getString(String key) {
    return _preferences?.getString(key);
  }

  // حذف رشته‌ای از SharedPreferences
  static Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  // پاکسازی تمامی داده‌ها از SharedPreferences
  static Future<void> clear() async {
    await _preferences?.clear();
  }
}
