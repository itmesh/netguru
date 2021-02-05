// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'netguru_value.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetguruValueAdapter extends TypeAdapter<NetguruValue> {
  @override
  final int typeId = 1;

  @override
  NetguruValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetguruValue(
      fields[0] as String,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NetguruValue obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetguruValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
