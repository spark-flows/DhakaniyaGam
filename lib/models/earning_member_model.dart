import 'package:hive_flutter/hive_flutter.dart';

part 'earning_member_model.g.dart';

@HiveType(typeId: 0)
class EarningMemberModel {
  @HiveField(0)
  String? familymember;
  @HiveField(1)
  String? business;
  @HiveField(2)
  String? otherBusiness;
  @HiveField(3)
  String? dob;
  @HiveField(4)
  int? annualIncome;
  @HiveField(5)
  int? relation;

  EarningMemberModel({
    this.familymember,
    this.business,
    this.otherBusiness,
    this.dob,
    this.annualIncome,
    this.relation,
  });

  factory EarningMemberModel.fromJson(Map<String, dynamic> json) =>
      EarningMemberModel(
        familymember: json["familymember"],
        business: json["business"],
        otherBusiness: json["other_business"],
        dob: json["dob"],
        annualIncome: json["annual_income"],
        relation: json["relation"],
      );

  Map<String, dynamic> toJson() => {
        "familymember": familymember,
        "business": business,
        "other_business": otherBusiness,
        "dob": dob,
        "annual_income": annualIncome,
        "relation": relation,
      };
}
