// To parse this JSON data, do
//
//     final getAllMessageModel = getAllMessageModelFromJson(jsonString);

import 'dart:convert';

GetAllMessageModel getAllMessageModelFromJson(String str) =>
    GetAllMessageModel.fromJson(json.decode(str));

String getAllMessageModelToJson(GetAllMessageModel data) =>
    json.encode(data.toJson());

class GetAllMessageModel {
  String? message;
  GetAllMessageData? data;
  int? status;
  bool? isSuccess;

  GetAllMessageModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetAllMessageModel.fromJson(Map<String, dynamic> json) =>
      GetAllMessageModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetAllMessageData.fromJson(json["Data"]),
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

class GetAllMessageData {
  List<GetAllMessageDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  GetAllMessageData({
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

  factory GetAllMessageData.fromJson(Map<String, dynamic> json) =>
      GetAllMessageData(
        docs: json["docs"] == null
            ? []
            : List<GetAllMessageDoc>.from(
                json["docs"]!.map((x) => GetAllMessageDoc.fromJson(x))),
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

class GetAllMessageDoc {
  String? id;
  String? subject;
  List<Document>? documents;
  String? description;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;
  String? docId;

  GetAllMessageDoc({
    this.id,
    this.subject,
    this.documents,
    this.description,
    this.status,
    this.createTimestamp,
    this.createdAt,
    this.docId,
  });

  factory GetAllMessageDoc.fromJson(Map<String, dynamic> json) =>
      GetAllMessageDoc(
        id: json["_id"],
        subject: json["subject"],
        documents: json["documents"] == null
            ? []
            : List<Document>.from(
                json["documents"]!.map((x) => Document.fromJson(x))),
        description: json["description"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        docId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "subject": subject,
        "documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x.toJson())),
        "description": description,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        "id": docId,
      };
}

class Document {
  String? id;
  String? path;

  Document({
    this.id,
    this.path,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["_id"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "path": path,
      };
}
