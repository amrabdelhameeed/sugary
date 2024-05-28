import 'package:hive_flutter/hive_flutter.dart';
part 'water_model.g.dart';

@HiveType(typeId: 5)
class WaterModel extends HiveObject {
  @HiveField(0)
  DateTime? dateTime;
  @HiveField(1)
  num? read;

  WaterModel(
    this.dateTime,
    this.read,
  );
}
