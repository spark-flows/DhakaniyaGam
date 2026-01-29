import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

FamilyMembersModel familyMembersModelFromJson(String str) =>
    FamilyMembersModel.fromJson(json.decode(str));

class FamilyMembersModel {
  String? message;
  List<FamilyMembersDatum>? data;
  int? status;
  bool? isSuccess;

  FamilyMembersModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory FamilyMembersModel.fromJson(Map<String, dynamic> json) =>
      FamilyMembersModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<FamilyMembersDatum>.from(json["Data"]!.map((x) => FamilyMembersDatum.fromJson(x))),
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

class FamilyMembersDatum {
  String? id;
  String? relation;
  String? surname;
  String? name;
  String? fathername;
  String? countryCode;
  String? mobile;
  String? dob;
  String? bloodGroup;
  String? education;
  String? otherEducation;
  String? schoolCollegeName;
  dynamic business;
  String? otherBusiness;
  bool? isMarried;
  String? dom;
  FatherInLaw? fatherInLaw;
  bool? isParent;
  String? parent;
  bool? status;
  CountryWiseContact? countryWiseContact;
  int? createTimestamp;
  DateTime? createdAt;

  FamilyMembersDatum({
    this.id,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
    this.countryCode,
    this.mobile,
    this.dob,
    this.bloodGroup,
    this.education,
    this.otherEducation,
    this.schoolCollegeName,
    this.business,
    this.otherBusiness,
    this.isMarried,
    this.dom,
    this.fatherInLaw,
    this.isParent,
    this.parent,
    this.status,
    this.countryWiseContact,
    this.createTimestamp,
    this.createdAt,
  });

  factory FamilyMembersDatum.fromJson(Map<String, dynamic> json) => FamilyMembersDatum(
        id: json["_id"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        countryCode: json["countryCode"],
        mobile: json["mobile"],
        dob: json["dob"],
        bloodGroup: json["blood_group"],
        education: json["education"],
        otherEducation: json["other_education"],
        schoolCollegeName: json["school_college_name"],
        business: json["business"],
        otherBusiness: json["other_business"],
        isMarried: json["is_married"],
        dom: json["dom"],
        fatherInLaw: json["father_in_law"] == null
            ? null
            : FatherInLaw.fromJson(json["father_in_law"]),
        isParent: json["is_parent"],
        parent: json["parent"],
        status: json["status"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : CountryWiseContact.fromJson(json["country_wise_contact"]),
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "relation": relation,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "countryCode": countryCode,
        "mobile": mobile,
        "dob": dob,
        "blood_group": bloodGroup,
        "education": education,
        "other_education": otherEducation,
        "school_college_name": schoolCollegeName,
        "business": business,
        "other_business": otherBusiness,
        "is_married": isMarried,
        "dom": dom,
        "father_in_law": fatherInLaw?.toJson(),
        "is_parent": isParent,
        "parent": parent,
        "status": status,
        "country_wise_contact": countryWiseContact?.toJson(),
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}
