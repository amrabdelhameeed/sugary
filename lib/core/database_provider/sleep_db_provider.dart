import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sugar/core/constants/app_date_formats.dart';
import 'package:sugar/core/models/cumulative_model.dart';
import 'package:sugar/core/models/sleep_model.dart';

import '../utils/app_database_keys.dart';

class SleepDBprovider {
  static final box = Hive.box<SleepModel>(AppDatabaseKeys.sleepServicesKey);

  static Future<void> deleteBox() async => {await box.clear()};

  static Future<void> delete(dynamic key) async => await box.delete(key);
  static ValueListenable<Box<SleepModel>> listenable() => box.listenable();
  static SleepModel? getItem(dynamic key) => box.get(key);

  static Future<void> put(SleepModel emergencyModel) {
    return box.put(AppDateFormats.dateFormat.format(emergencyModel.dateTime!), emergencyModel);
  }
}
