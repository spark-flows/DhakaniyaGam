import 'package:hive_flutter/hive_flutter.dart';

part 'child_model.g.dart';

@HiveType(typeId: 0)
class ChildsModel {
  @HiveField(0)
  String? familymember;
  @HiveField(1)
  String? dob;
  @HiveField(2)
  String? education;
  @HiveField(3)
  String? otherEducation;
  @HiveField(4)
  int? fees;
  @HiveField(5)
  String? feeReceipt;
  @HiveField(6)
  bool? isMarried;
  @HiveField(7)
  String? business;
  @HiveField(8)
  String? otherBusiness;
  @HiveField(9)
  String? relation;
  @HiveField(10)
  String? fullname;

  ChildsModel({
    this.familymember,
    this.dob,
    this.education,
    this.otherEducation,
    this.fees,
    this.feeReceipt,
    this.isMarried,
    this.business,
    this.otherBusiness,
    this.relation,
    this.fullname,
  });
}

