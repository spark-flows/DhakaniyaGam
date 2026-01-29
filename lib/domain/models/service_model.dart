// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
    String? message;
    ServiceData? data;
    int? status;
    bool? isSuccess;

    ServiceModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        message: json["Message"],
        data: json["Data"] == null ? null : ServiceData.fromJson(json["Data"]),
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

class ServiceData {
    List<ServiceDoc>? docs;
    int? totalDocs;
    int? limit;
    int? totalPages;
    int? page;
    int? pagingCounter;
    bool? hasPrevPage;
    bool? hasNextPage;
    dynamic prevPage;
    dynamic nextPage;

    ServiceData({
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

    factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        docs: json["docs"] == null ? [] : List<ServiceDoc>.from(json["docs"]!.map((x) => ServiceDoc.fromJson(x))),
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

class ServiceDoc {
    String? id;
    String? path;
    bool? status;
    int? createTimestamp;
    DateTime? createdAt;
    String? docId;

    ServiceDoc({
        this.id,
        this.path,
        this.status,
        this.createTimestamp,
        this.createdAt,
        this.docId,
    });

    factory ServiceDoc.fromJson(Map<String, dynamic> json) => ServiceDoc(
        id: json["_id"],
        path: json["path"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        docId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "path": path,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        "id": docId,
    };
}
