import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sugar/core/models/emergency_model.dart';

import '../utils/app_database_keys.dart';

class EmergencyServicesDBprovider {
  static final _box = Hive.box<EmergencyModel>(AppDatabaseKeys.emergencyServicesKey);

  static Future<void> deleteBox() async => {await _box.clear()};

  static Future<void> delete(dynamic key) async => await _box.delete(key);
  static ValueListenable<Box<EmergencyModel>> listenable() => _box.listenable();

  static Future<void> add(EmergencyModel emergencyModel) {
    return _box.add(emergencyModel);
  }
}
