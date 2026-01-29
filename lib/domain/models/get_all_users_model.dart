// To parse this JSON data, do
//
//     final getAllUsersModel = getAllUsersModelFromJson(jsonString);

import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

GetAllUsersModel getAllUsersModelFromJson(String str) =>
    GetAllUsersModel.fromJson(json.decode(str));

String getAllUsersModelToJson(GetAllUsersModel data) =>
    json.encode(data.toJson());

class GetAllUsersModel {
  String? message;
  GetAllUsersData? data;
  int? status;
  bool? isSuccess;

  GetAllUsersModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetAllUsersModel.fromJson(Map<String, dynamic> json) =>
      GetAllUsersModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetAllUsersData.fromJson(json["Data"]),
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

class GetAllUsersData {
  List<GetAllUsersDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  GetAllUsersData({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory GetAllUsersData.fromJson(Map<String, dynamic> json) =>
      GetAllUsersData(
        docs: json["docs"] == null
            ? []
            : List<GetAllUsersDoc>.from(
                json["docs"]!.map((x) => GetAllUsersDoc.fromJson(x))),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "docs": docs == null
            ? []
            : List<dynamic>.from(docs!.map((x) => x.toJson())),
        "totalDocs": totalDocs,
        "limit": limit,
        "totalPages": totalPages,
        "page": page,
        "pagingCounter": pagingCounter,
        "hasPrevPage": hasPrevPage,
        "hasNextPage": hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage,
      };
}

class GetAllUsersDoc {
  String? id;
  String? relation;
  String? surname;
  String? name;
  String? fathername;
  Village? village;
  String? countryCode;
  String? mobile;
  bool? isParent;
  dynamic parent;
  bool? status;
  String? userCode;
  String? profilePic;
  CountryWiseContact? countryWiseContact;
  bool? paymentStatus;
  bool? isApproved;
  int? createTimestamp;
  DateTime? createdAt;

  GetAllUsersDoc({
    this.id,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
    this.village,
    this.countryCode,
    this.mobile,
    this.isParent,
    this.parent,
    this.status,
    this.userCode,
    this.profilePic,
    this.countryWiseContact,
    this.paymentStatus,
    this.isApproved,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetAllUsersDoc.fromJson(Map<String, dynamic> json) => GetAllUsersDoc(
        id: json["_id"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        village:
            json["village"] == null ? null : Village.fromJson(json["village"]),
        countryCode: json["countryCode"],
        mobile: json["mobile"],
        isParent: json["is_parent"],
        parent: json["parent"],
        status: json["status"],
        userCode: json["user_code"],
        profilePic: json["profile_pic"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : CountryWiseContact.fromJson(json["country_wise_contact"]),
        paymentStatus: json["payment_status"],
        isApproved: json["is_approved"],
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
        "village": village?.toJson(),
        "countryCode": countryCode,
        "mobile": mobile,
        "is_parent": isParent,
        "parent": parent,
        "status": status,
        "user_code": userCode,
        "profile_pic": profilePic,
        "country_wise_contact": countryWiseContact?.toJson(),
        "payment_status": paymentStatus,
        "is_approved": isApproved,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class Village {
  String? id;
  String? englishName;
  String? gujaratiName;
  String? code;
  bool? status;
  DateTime? createdAt;

  Village({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.code,
    this.status,
    this.createdAt,
  });

  factory Village.fromJson(Map<String, dynamic> json) => Village(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        code: json["code"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "code": code,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
      };
}
