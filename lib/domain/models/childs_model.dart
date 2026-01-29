import 'dart:convert';

ChildModel childsModelFromJson(String str) =>
    ChildModel.fromJson(json.decode(str));

String childsModelToJson(ChildModel data) => json.encode(data.toJson());

class ChildModel {
  String? familymember;
  String? dob;
  String? education;
  String? otherEducation;
  int? fees;
  String? feeReceipt;
  bool? isMarried;
  String? business;
  String? otherBusiness;
  String? relation;
  String? fullname;

  ChildModel({
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

  factory ChildModel.fromJson(Map<String, dynamic> json) => ChildModel(
        familymember: json["familymember"],
        dob: json["dob"],
        education: json["education"],
        otherEducation: json["other_education"],
        fees: json["fees"],
        feeReceipt: json["fee_receipt"],
        isMarried: json["is_married"],
        business: json["business"],
        otherBusiness: json["other_business"],
      );

  Map<String, dynamic> toJson() => {
        "familymember": familymember,
        "dob": dob,
        "education": education,
        "other_education": otherEducation,
        "fees": fees,
        "fee_receipt": feeReceipt,
        "is_married": isMarried,
        "business": business,
        "other_business": otherBusiness,
      };
}

class Pierre {
  String? fathername;
  String? village;

  Pierre({
    this.fathername,
    this.village,
  });

  factory Pierre.fromJson(Map<String, dynamic> json) => Pierre(
        fathername: json["fathername"],
        village: json["village"],
      );

  Map<String, dynamic> toJson() => {
        "fathername": fathername,
        "village": village,
      };
}
class EarningMember {
    String? familymember;
    String? dob;
    String? education;
    String? business;
    int? annualIncome;

    EarningMember({
        this.familymember,
        this.dob,
        this.education,
        this.business,
        this.annualIncome,
    });

    factory EarningMember.fromJson(Map<String, dynamic> json) => EarningMember(
        familymember: json["familymember"],
        dob: json["dob"],
        education: json["education"],
        business: json["business"],
        annualIncome: json["annual_income"],
    );

    Map<String, dynamic> toJson() => {
        "familymember": familymember,
        "dob": dob,
        "education": education,
        "business": business,
        "annual_income": annualIncome,
    };
}