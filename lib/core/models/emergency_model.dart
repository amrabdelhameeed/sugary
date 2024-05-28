import 'package:hive_flutter/hive_flutter.dart';
part 'emergency_model.g.dart';

@HiveType(typeId: 0)
class EmergencyModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? number;
  EmergencyModel(this.name, this.number);
}
