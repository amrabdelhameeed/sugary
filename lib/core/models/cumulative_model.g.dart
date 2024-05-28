// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cumulative_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CumulativeModelAdapter extends TypeAdapter<CumulativeModel> {
  @override
  final int typeId = 2;

  @override
  CumulativeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CumulativeModel(
      fields[0] as DateTime?,
      fields[1] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, CumulativeModel obj) {
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
      other is CumulativeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
