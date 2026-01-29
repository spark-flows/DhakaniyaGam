import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

GalleryModel galleryModelFromJson(String str) =>
    GalleryModel.fromJson(json.decode(str));

String galleryModelToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel {
  String? message;
  GalleryData? data;
  int? status;
  bool? isSuccess;

  GalleryModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        message: json["Message"],
        data: json["Data"] == null ? null : GalleryData.fromJson(json["Data"]),
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

class GalleryData {
  List<GalleryDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  GalleryData({
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

  factory GalleryData.fromJson(Map<String, dynamic> json) => GalleryData(
        docs: json["docs"] == null
            ? []
            : List<GalleryDoc>.from(
                json["docs"]!.map((x) => GalleryDoc.fromJson(x))),
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

class GalleryDoc {
  String? id;
  String? subject;
  DateTime? date;
  int? dateTimestamp;
  List<Document>? documents;
  String? description;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;
  String? docId;
  GalleryDoc({
    this.id,
    this.subject,
    this.date,
    this.dateTimestamp,
    this.documents,
    this.description,
    this.status,
    this.createTimestamp,
    this.createdAt,
    this.docId,
  });

  factory GalleryDoc.fromJson(Map<String, dynamic> json) => GalleryDoc(
        id: json["_id"],
        subject: json["subject"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateTimestamp: json["date_timestamp"],
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
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_timestamp": dateTimestamp,
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
