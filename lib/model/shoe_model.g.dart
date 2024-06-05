// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoeModelAdapter extends TypeAdapter<ShoeModel> {
  @override
  final int typeId = 1;

  @override
  ShoeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoeModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      image: fields[2] as String,
      price: fields[3] as String,
      quantity: fields[4] as int,
      catagory: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShoeModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.catagory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
