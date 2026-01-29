import 'dart:convert';

import 'package:dhakaniya_gam/domain/models/models.dart';

AppliedWindowModel appliedWindowModelFromJson(String str) =>
    AppliedWindowModel.fromJson(json.decode(str));

String appliedWindowModelToJson(AppliedWindowModel data) =>
    json.encode(data.toJson());

class AppliedWindowModel {
  String? message;
  List<AppliedWindowData>? data;
  int? status;
  bool? isSuccess;

  AppliedWindowModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory AppliedWindowModel.fromJson(Map<String, dynamic> json) =>
      AppliedWindowModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<AppliedWindowData>.from(
                json["Data"]!.map((x) => AppliedWindowData.fromJson(x))),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "Status": status,
        "IsSuccess": isSuccess,
      };
}

class AppliedWindowData {
  String? id;
  String? parent;
  int? year;
  Familymember? familymember;
  String? profilePic;
  String? countryCode;
  String? mobile;
  CountryWiseContact? countryWiseContact;
  String? action;
  int? createTimestamp;
  DateTime? createdAt;
  int? amount;

  AppliedWindowData({
    this.id,
    this.parent,
    this.year,
    this.familymember,
    this.profilePic,
    this.countryCode,
    this.mobile,
    this.countryWiseContact,
    this.action,
    this.createTimestamp,
    this.createdAt,
    this.amount,
  });

  factory AppliedWindowData.fromJson(Map<String, dynamic> json) =>
      AppliedWindowData(
        id: json["_id"],
        parent: json["parent"],
        year: json["year"],
        familymember: json["familymember"] == null
            ? null
            : Familymember.fromJson(json["familymember"]),
        profilePic: json["profile_pic"],
        countryCode: json["countryCode"],
        mobile: json["mobile"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : CountryWiseContact.fromJson(json["country_wise_contact"]),
        action: json["action"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent,
        "year": year,
        "familymember": familymember?.toJson(),
        "profile_pic": profilePic,
        "countryCode": countryCode,
        "mobile": mobile,
        "country_wise_contact": countryWiseContact?.toJson(),
        "action": action,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        "amount": amount,
      };
}

class Child {
  String? child;
  DateTime? dob;
  String? education;
  int? fees;
  String? feeReceipt;
  bool? isMarried;
  String? business;

  Child({
    this.child,
    this.dob,
    this.education,
    this.fees,
    this.feeReceipt,
    this.isMarried,
    this.business,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        child: json["child"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        education: json["education"],
        fees: json["fees"],
        feeReceipt: json["fee_receipt"],
        isMarried: json["is_married"],
        business: json["business"],
      );

  Map<String, dynamic> toJson() => {
        "child": child,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "education": education,
        "fees": fees,
        "fee_receipt": feeReceipt,
        "is_married": isMarried,
        "business": business,
      };
}
