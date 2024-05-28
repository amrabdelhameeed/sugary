import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sugar/core/models/medication_model.dart';

import '../utils/app_database_keys.dart';

class MedicationDBprovider {
  static final _box = Hive.box<MedicationModel>(AppDatabaseKeys.medicationServicesKey);

  static Future<void> deleteBox() async => {await _box.clear()};

  static Future<void> delete(dynamic key) async => await _box.delete(key);
  static ValueListenable<Box<MedicationModel>> listenable() => _box.listenable();

  static Future<void> add(int key, MedicationModel emergencyModel) {
    return _box.put(key, emergencyModel);
  }
}
