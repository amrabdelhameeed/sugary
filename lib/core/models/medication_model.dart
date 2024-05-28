import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'medication_model.g.dart';

@HiveType(typeId: 3)
class MedicationModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  List<String>? weekDays;
  @HiveField(2)
  String? timeOfDay;

  MedicationModel(this.name, this.weekDays, this.timeOfDay);
}
