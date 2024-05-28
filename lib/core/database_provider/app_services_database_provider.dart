import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/app_database_keys.dart';

class AppServicesDBprovider {
  static final _box = Hive.box<String>(AppDatabaseKeys.appServicesKey);
  static Future<void> delete(String key) async => await _box.delete(key);
  static ValueListenable<Box<String>> listenable() => _box.listenable();
  // theme
  // '1' => dark , '0' => light
  static bool isDark() => _box.get(AppDatabaseKeys.themeKey) == '1';
  static Future<void> switchTheme() async {
    await _box.put(AppDatabaseKeys.themeKey, isDark() ? '0' : '1');
  }

  // locale
  static String currentLocale() => _box.get(AppDatabaseKeys.localeKey) ?? "en";
  static Future<void> changeLocale(String locale) async {
    await _box.put(AppDatabaseKeys.localeKey, locale);
  }

  //first-open
  static Future<void> setFirstOpen() async {
    await _box.put(AppDatabaseKeys.firstOpenKey, AppDatabaseKeys.firstOpenKey);
  }

  static bool isFirstOpen() => _box.get(AppDatabaseKeys.firstOpenKey) == null;

  // //token
  // static Future<void> saveToken(String token) async {
  //   await _box.put(AppDatabaseKeys.tokenKey, token);
  // }

  //featureView
  static Future<void> savefeatureView() async {
    await _box.put(AppDatabaseKeys.featureViewKey, AppDatabaseKeys.featureViewKey);
  }

  static bool isFeatureViewed() => _box.get(AppDatabaseKeys.featureViewKey) == null ? false : true;

  static Future<void> rememberMe({required bool value}) async {
    await _box.put(AppDatabaseKeys.rememberMe, value ? "1" : "0");
  }

  static bool isRememberMe() => (_box.get(AppDatabaseKeys.rememberMe) ?? "0") == "1";
}
