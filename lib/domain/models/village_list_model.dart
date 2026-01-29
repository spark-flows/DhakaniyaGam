// To parse this JSON data, do
//
//     final villageListDataModel = villageListDataModelFromJson(jsonString);

import 'dart:convert';

VillageListDataModel villageListDataModelFromJson(String str) =>
    VillageListDataModel.fromJson(json.decode(str));

String villageListDataModelToJson(VillageListDataModel data) =>
    json.encode(data.toJson());

class VillageListDataModel {
  String? message;
  VillageListData? data;
  int? status;
  bool? isSuccess;

  VillageListDataModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory VillageListDataModel.fromJson(Map<String, dynamic> json) =>
      VillageListDataModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : VillageListData.fromJson(json["Data"]),
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

class VillageListData {
  List<VillageListDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  VillageListData({
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

  factory VillageListData.fromJson(Map<String, dynamic> json) =>
      VillageListData(
        docs: json["docs"] == null
            ? []
            : List<VillageListDoc>.from(
                json["docs"]!.map((x) => VillageListDoc.fromJson(x))),
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

class VillageListDoc {
  String? id;
  String? englishName;
  String? gujaratiName;
  String? code;
  bool? status;
  DateTime? createdAt;
  String? docId;
  int? totalMembers;

  VillageListDoc({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.code,
    this.status,
    this.createdAt,
    this.docId,
    this.totalMembers,
  });

  factory VillageListDoc.fromJson(Map<String, dynamic> json) => VillageListDoc(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        code: json["code"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        docId: json["id"],
        totalMembers: json["total_members"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "code": code,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "id": docId,
        "total_members": totalMembers,
      };
}
