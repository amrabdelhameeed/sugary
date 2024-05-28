// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterModelAdapter extends TypeAdapter<WaterModel> {
  @override
  final int typeId = 5;

  @override
  WaterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterModel(
      fields[0] as DateTime?,
      fields[1] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, WaterModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.read);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
