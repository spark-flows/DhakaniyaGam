// To parse this JSON data, do
//
//     final villageRepresentativesModel = villageRepresentativesModelFromJson(jsonString);

import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

VillageRepresentativesModel villageRepresentativesModelFromJson(String str) => VillageRepresentativesModel.fromJson(json.decode(str));

String villageRepresentativesModelToJson(VillageRepresentativesModel data) => json.encode(data.toJson());

class VillageRepresentativesModel {
    String? message;
    List<VillageRepresentativesData>? data;
    int? status;
    bool? isSuccess;

    VillageRepresentativesModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory VillageRepresentativesModel.fromJson(Map<String, dynamic> json) => VillageRepresentativesModel(
        message: json["Message"],
        data: json["Data"] == null ? [] : List<VillageRepresentativesData>.from(json["Data"]!.map((x) => VillageRepresentativesData.fromJson(x))),
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

class VillageRepresentativesData {
    String? id;
    User? user;
    Village? village;
    String? designation;
    bool? status;
    DateTime? createdAt;

    VillageRepresentativesData({
        this.id,
        this.user,
        this.village,
        this.designation,
        this.status,
        this.createdAt,
    });

    factory VillageRepresentativesData.fromJson(Map<String, dynamic> json) => VillageRepresentativesData(
        id: json["_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        village: json["village"] == null ? null : Village.fromJson(json["village"]),
        designation: json["designation"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "village": village?.toJson(),
        "designation": designation,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
    };
}

