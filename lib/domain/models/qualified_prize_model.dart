import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

QualifiedPrizeModel qualifiedPrizeModelFromJson(String str) => QualifiedPrizeModel.fromJson(json.decode(str));

class QualifiedPrizeModel {
    String? message;
    QualifiedPrizeData? data;
    int? status;
    bool? isSuccess;

    QualifiedPrizeModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory QualifiedPrizeModel.fromJson(Map<String, dynamic> json) => QualifiedPrizeModel(
        message: json["Message"],
        data: json["Data"] == null ? null : QualifiedPrizeData.fromJson(json["Data"]),
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

class QualifiedPrizeData {
    List<QualifiedPrizeDoc>? docs;
    int? totalDocs;
    int? limit;
    int? totalPages;
    int? page;
    int? pagingCounter;
    bool? hasPrevPage;
    bool? hasNextPage;
    dynamic prevPage;
    dynamic nextPage;

    QualifiedPrizeData({
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

    factory QualifiedPrizeData.fromJson(Map<String, dynamic> json) => QualifiedPrizeData(
        docs: json["docs"] == null ? [] : List<QualifiedPrizeDoc>.from(json["docs"]!.map((x) => QualifiedPrizeDoc.fromJson(x))),
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
        "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
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

class QualifiedPrizeDoc {
    String? id;
    Familymember? parent;
    Familymember? familymember;
    Village? village;
    int? year;
    String? education;
    String? medium;
    num? percentage;
    String? action;
    bool? prize;
    int? createTimestamp;
    DateTime? createdAt;
    bool? stationery;
    String? docId;

    QualifiedPrizeDoc({
        this.id,
        this.parent,
        this.familymember,
        this.village,
        this.year,
        this.education,
        this.medium,
        this.percentage,
        this.action,
        this.prize,
        this.createTimestamp,
        this.createdAt,
         this.stationery,
        this.docId,
    });

    factory QualifiedPrizeDoc.fromJson(Map<String, dynamic> json) => QualifiedPrizeDoc(
        id: json["_id"],
        parent: json["parent"] == null ? null : Familymember.fromJson(json["parent"]),
        familymember: json["familymember"] == null ? null : Familymember.fromJson(json["familymember"]),
        village: json["village"] == null ? null : Village.fromJson(json["village"]),
        year: json["year"],
        education: json["education"],
        medium: json["medium"],
        percentage: json["percentage"],
        action: json["action"],
        prize: json["prize"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        stationery: json["stationery"],
        docId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent?.toJson(),
        "familymember": familymember?.toJson(),
        "village": village?.toJson(),
        "year": year,
        "education": education,
        "medium": medium,
        "percentage": percentage,
        "action": action,
        "prize": prize,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        "stationery": stationery,
        "id": docId,
    };
}
