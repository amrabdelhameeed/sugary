import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sugar/core/models/cumulative_model.dart';

import '../utils/app_database_keys.dart';

class CumulativeDBprovider {
  static final box = Hive.box<CumulativeModel>(AppDatabaseKeys.cumulativeServicesKey);

  static Future<void> deleteBox() async => {await box.clear()};

  static Future<void> delete(dynamic key) async => await box.delete(key);
  static ValueListenable<Box<CumulativeModel>> listenable() => box.listenable();

  static Future<void> add(CumulativeModel emergencyModel) {
    return box.add(emergencyModel);
  }
}
