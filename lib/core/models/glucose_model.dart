import 'package:hive_flutter/hive_flutter.dart';
part 'glucose_model.g.dart';

@HiveType(typeId: 1)
class GlucoseModel extends HiveObject {
  @HiveField(0)
  DateTime? dateTime;
  @HiveField(1)
  num? read;
  @HiveField(2)
  num? insulin;

  GlucoseModel(this.dateTime, this.read, this.insulin);
}
