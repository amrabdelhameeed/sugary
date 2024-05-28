import 'package:hive_flutter/hive_flutter.dart';
part 'sleep_model.g.dart';

@HiveType(typeId: 4)
class SleepModel extends HiveObject {
  @HiveField(0)
  DateTime? dateTime;
  @HiveField(1)
  num? read;

  SleepModel(
    this.dateTime,
    this.read,
  );
}
