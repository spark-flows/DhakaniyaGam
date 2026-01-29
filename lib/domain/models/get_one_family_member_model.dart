// To parse this JSON data, do
//
//     final getOneFamilyMemberModel = getOneFamilyMemberModelFromJson(jsonString);

import 'dart:convert';

import 'package:dhakaniya_gam/domain/models/models.dart';

GetOneFamilyMemberModel getOneFamilyMemberModelFromJson(String str) =>
    GetOneFamilyMemberModel.fromJson(json.decode(str));

String getOneFamilyMemberModelToJson(GetOneFamilyMemberModel data) =>
    json.encode(data.toJson());

class GetOneFamilyMemberModel {
  String? message;
  GetOneFamilyMemberData? data;
  int? status;
  bool? isSuccess;

  GetOneFamilyMemberModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneFamilyMemberModel.fromJson(Map<String, dynamic> json) =>
      GetOneFamilyMemberModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetOneFamilyMemberData.fromJson(json["Data"]),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data?.toJson(),
        "Status": status,
        "IsSuccess": isSuccess,
      };
}

class GetOneFamilyMemberData {
  String? id;
  String? parent;
  String? relation;
  String? profilePic;
  String? surname;
  String? name;
  String? fathername;
  String? mobile;
  String? countryCode;
  CountryWiseContact? countryWiseContact;
  String? dob;
  String? bloodGroup;
  Business? education;
  String? otherEducation;
  String? schoolCollegeName;
  Business? business;
  String? otherBusiness;
  String? businessDetails;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  GetOneFamilyMemberData({
    this.id,
    this.parent,
    this.relation,
    this.profilePic,
    this.surname,
    this.name,
    this.fathername,
    this.mobile,
    this.countryCode,
    this.countryWiseContact,
    this.dob,
    this.bloodGroup,
    this.education,
    this.otherEducation,
    this.schoolCollegeName,
    this.business,
    this.otherBusiness,
    this.businessDetails,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetOneFamilyMemberData.fromJson(Map<String, dynamic> json) =>
      GetOneFamilyMemberData(
        id: json["_id"],
        parent: json["parent"],
        relation: json["relation"],
        profilePic: json["profile_pic"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        mobile: json["mobile"],
        countryCode: json["countryCode"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : CountryWiseContact.fromJson(json["country_wise_contact"]),
        dob: json["dob"],
        bloodGroup: json["blood_group"],
        education: json["education"] == null
            ? null
            : Business.fromJson(json["education"]),
        otherEducation: json["other_education"],
        schoolCollegeName: json["school_college_name"],
        business: json["business"] == null
            ? null
            : Business.fromJson(json["business"]),
        otherBusiness: json["other_business"],
        businessDetails: json["business_details"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent,
        "relation": relation,
        "profile_pic": profilePic,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "mobile": mobile,
        "countryCode": countryCode,
        "country_wise_contact": countryWiseContact?.toJson(),
        "dob": dob,
        "blood_group": bloodGroup,
        "education": education?.toJson(),
        "other_education": otherEducation,
        "school_college_name": schoolCollegeName,
        "business": business?.toJson(),
        "other_business": otherBusiness,
        "business_details": businessDetails,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}
