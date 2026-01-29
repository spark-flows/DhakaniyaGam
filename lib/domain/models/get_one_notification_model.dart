// To parse this JSON data, do
//
//     final getOneNotificationModel = getOneNotificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

GetOneNotificationModel getOneNotificationModelFromJson(String str) =>
    GetOneNotificationModel.fromJson(json.decode(str));

String getOneNotificationModelToJson(GetOneNotificationModel data) =>
    json.encode(data.toJson());

class GetOneNotificationModel {
  String? message;
  GetAllMessageDoc? data;
  int? status;
  bool? isSuccess;

  GetOneNotificationModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneNotificationModel.fromJson(Map<String, dynamic> json) =>
      GetOneNotificationModel(
        message: json["Message"],
        data: json["Data"] == null ? null : GetAllMessageDoc.fromJson(json["Data"]),
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
