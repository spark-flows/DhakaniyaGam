// To parse this JSON data, do
//
//     final educationListModel = educationListModelFromJson(jsonString);

import 'dart:convert';

EducationListModel educationListModelFromJson(String str) => EducationListModel.fromJson(json.decode(str));

String educationListModelToJson(EducationListModel data) => json.encode(data.toJson());

class EducationListModel {
    String? message;
    List<EducationData>? data;
    int? status;
    bool? isSuccess;

    EducationListModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory EducationListModel.fromJson(Map<String, dynamic> json) => EducationListModel(
        message: json["Message"],
        data: json["Data"] == null ? [] : List<EducationData>.from(json["Data"]!.map((x) => EducationData.fromJson(x))),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "Status": status,
        "IsSuccess": isSuccess,
    };
}

class EducationData {
    String? id;
    String? englishName;
    String? gujaratiName;
    bool? status;
    DateTime? createdAt;

    EducationData({
        this.id,
        this.englishName,
        this.gujaratiName,
        this.status,
        this.createdAt,
    });

    factory EducationData.fromJson(Map<String, dynamic> json) => EducationData(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
    };
}
