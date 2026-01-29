// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earning_member_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EarningMemberModelAdapter extends TypeAdapter<EarningMemberModel> {
  @override
  final int typeId = 1;

  @override
  EarningMemberModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EarningMemberModel(
      familymember: fields[0] as String?,
      business: fields[1] as String?,
      otherBusiness: fields[2] as String?,
      dob: fields[3] as String?,
      annualIncome: fields[4] as int?,
      relation: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, EarningMemberModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.familymember)
      ..writeByte(1)
      ..write(obj.business)
      ..writeByte(2)
      ..write(obj.otherBusiness)
      ..writeByte(3)
      ..write(obj.dob)
      ..writeByte(4)
      ..write(obj.annualIncome)
      ..writeByte(5)
      ..write(obj.relation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EarningMemberModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
