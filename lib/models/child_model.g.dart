// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChildsModelAdapter extends TypeAdapter<ChildsModel> {
  @override
  final int typeId = 0;

  @override
  ChildsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChildsModel(
      familymember: fields[0] as String?,
      dob: fields[1] as String?,
      education: fields[2] as String?,
      otherEducation: fields[3] as String?,
      fees: fields[4] as int?,
      feeReceipt: fields[5] as String?,
      isMarried: fields[6] as bool?,
      business: fields[7] as String?,
      otherBusiness: fields[8] as String?,
      relation: fields[9] as String?,
      fullname: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChildsModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.familymember)
      ..writeByte(1)
      ..write(obj.dob)
      ..writeByte(2)
      ..write(obj.education)
      ..writeByte(3)
      ..write(obj.otherEducation)
      ..writeByte(4)
      ..write(obj.fees)
      ..writeByte(5)
      ..write(obj.feeReceipt)
      ..writeByte(6)
      ..write(obj.isMarried)
      ..writeByte(7)
      ..write(obj.business)
      ..writeByte(8)
      ..write(obj.otherBusiness)
      ..writeByte(9)
      ..write(obj.relation)
      ..writeByte(10)
      ..write(obj.fullname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChildsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
