// To parse this JSON data, do
//
//     final getOneGalleryModel = getOneGalleryModelFromJson(jsonString);

import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

GetOneGalleryModel getOneGalleryModelFromJson(String str) =>
    GetOneGalleryModel.fromJson(json.decode(str));

String getOneGalleryModelToJson(GetOneGalleryModel data) =>
    json.encode(data.toJson());

class GetOneGalleryModel {
  String? message;
  GalleryDoc? data;
  int? status;
  bool? isSuccess;

  GetOneGalleryModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneGalleryModel.fromJson(Map<String, dynamic> json) =>
      GetOneGalleryModel(
        message: json["Message"],
        data: json["Data"] == null ? null : GalleryDoc.fromJson(json["Data"]),
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
