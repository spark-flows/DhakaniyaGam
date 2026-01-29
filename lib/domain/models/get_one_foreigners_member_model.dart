// To parse this JSON data, do
//
//     final getOneForeignersMemberModel = getOneForeignersMemberModelFromJson(jsonString);

import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

GetOneForeignersMemberModel getOneForeignersMemberModelFromJson(String str) =>
    GetOneForeignersMemberModel.fromJson(json.decode(str));

String getOneForeignersMemberModelToJson(GetOneForeignersMemberModel data) =>
    json.encode(data.toJson());

class GetOneForeignersMemberModel {
  String? message;
  GetOneForeignersData? data;
  int? status;
  bool? isSuccess;

  GetOneForeignersMemberModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneForeignersMemberModel.fromJson(Map<String, dynamic> json) =>
      GetOneForeignersMemberModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetOneForeignersData.fromJson(json["Data"]),
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

class GetOneForeignersData {
  String? id;
  String? parentId;
  GetOneFamilymemberId? familymemberId;
  String? mobile;
  String? countryCode;
  CountryWiseContact? countryWiseContact;
  String? dataFor;
  Business? education;
  String? otherEducation;
  String? universityName;
  Business? business;
  String? otherBusiness;
  String? country;
  String? city;
  int? from;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  GetOneForeignersData({
    this.id,
    this.parentId,
    this.familymemberId,
    this.mobile,
    this.countryCode,
    this.countryWiseContact,
    this.dataFor,
    this.education,
    this.otherEducation,
    this.universityName,
    this.business,
    this.otherBusiness,
    this.country,
    this.city,
    this.from,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetOneForeignersData.fromJson(Map<String, dynamic> json) =>
      GetOneForeignersData(
        id: json["_id"],
        parentId: json["parentId"],
        familymemberId: json["familymemberId"] == null
            ? null
            : GetOneFamilymemberId.fromJson(json["familymemberId"]),
        mobile: json["mobile"],
        countryCode: json["countryCode"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : CountryWiseContact.fromJson(json["country_wise_contact"]),
        dataFor: json["For"],
        education: json["education"] == null
            ? null
            : Business.fromJson(json["education"]),
        otherEducation: json["other_education"],
        universityName: json["university_name"],
        business: json["business"] == null
            ? null
            : Business.fromJson(json["business"]),
        otherBusiness: json["other_business"],
        country: json["country"],
        city: json["city"],
        from: json["from"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parentId": parentId,
        "familymemberId": familymemberId?.toJson(),
        "mobile": mobile,
        "countryCode": countryCode,
        "country_wise_contact": countryWiseContact?.toJson(),
        "For": dataFor,
        "education": education?.toJson(),
        "other_education": otherEducation,
        "university_name": universityName,
        "business": business?.toJson(),
        "other_business": otherBusiness,
        "country": country,
        "city": city,
        "from": from,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class GetOneFamilymemberId {
  String? id;
  String? parent;
  String? relation;
  String? surname;
  String? name;
  String? fathername;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  GetOneFamilymemberId({
    this.id,
    this.parent,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetOneFamilymemberId.fromJson(Map<String, dynamic> json) =>
      GetOneFamilymemberId(
        id: json["_id"],
        parent: json["parent"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
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
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}
