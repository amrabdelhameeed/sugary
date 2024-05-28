import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sugar/core/constants/app_date_formats.dart';
import 'package:sugar/core/models/cumulative_model.dart';
import 'package:sugar/core/models/water_model.dart';

import '../utils/app_database_keys.dart';

class WaterDBprovider {
  static final box = Hive.box<WaterModel>(AppDatabaseKeys.waterServicesKey);

  static Future<void> deleteBox() async => {await box.clear()};

  static Future<void> delete(dynamic key) async => await box.delete(key);
  static ValueListenable<Box<WaterModel>> listenable() => box.listenable();

  static WaterModel? getItem(dynamic key) => box.get(key);

  static Future<void> put(WaterModel emergencyModel) {
    return box.put(AppDateFormats.dateFormat.format(emergencyModel.dateTime!), emergencyModel);
  }
}
