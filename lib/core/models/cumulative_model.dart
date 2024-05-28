import 'package:hive_flutter/hive_flutter.dart';
part 'cumulative_model.g.dart';

@HiveType(typeId: 2)
class CumulativeModel extends HiveObject {
  @HiveField(0)
  DateTime? dateTime;
  @HiveField(1)
  num? read;

  CumulativeModel(
    this.dateTime,
    this.read,
  );
}
