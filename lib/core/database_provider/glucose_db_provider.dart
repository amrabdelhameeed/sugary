import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sugar/core/models/glucose_model.dart';

import '../utils/app_database_keys.dart';

class GlucoseDBprovider {
  static final box = Hive.box<GlucoseModel>(AppDatabaseKeys.glucoseServicesKey);

  static Future<void> deleteBox() async => {await box.clear()};

  static Future<void> delete(dynamic key) async => await box.delete(key);
  static ValueListenable<Box<GlucoseModel>> listenable() => box.listenable();

  static Future<void> add(GlucoseModel emergencyModel) {
    return box.add(emergencyModel);
  }
}
