// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glucose_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlucoseModelAdapter extends TypeAdapter<GlucoseModel> {
  @override
  final int typeId = 1;

  @override
  GlucoseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlucoseModel(
      fields[0] as DateTime?,
      fields[1] as num?,
      fields[2] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, GlucoseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.read)
      ..writeByte(2)
      ..write(obj.insulin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlucoseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
