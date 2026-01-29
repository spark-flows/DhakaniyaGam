import 'dart:convert';

import 'package:dhakaniya_gam/domain/models/models.dart';

ScolarshipsListModel scolarshipsListModelFromJson(String str) =>
    ScolarshipsListModel.fromJson(json.decode(str));

class ScolarshipsListModel {
  String? message;
  List<ScolarshipsData>? data;
  int? status;
  bool? isSuccess;

  ScolarshipsListModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory ScolarshipsListModel.fromJson(Map<String, dynamic> json) =>
      ScolarshipsListModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<ScolarshipsData>.from(
                json["Data"]!.map((x) => ScolarshipsData.fromJson(x))),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "Status": status,
        "IsSuccess": isSuccess,
      };
}

class ScolarshipsData {
  String? id;
  String? parent;
  Familymember? familymember;
  int? year;
  String? action;
  int? amount;
  int? createTimestamp;
  String? createdAt;

  ScolarshipsData({
    this.id,
    this.parent,
    this.familymember,
    this.year,
    this.action,
    this.amount,
    this.createTimestamp,
    this.createdAt,
  });

  factory ScolarshipsData.fromJson(Map<String, dynamic> json) =>
      ScolarshipsData(
        id: json["_id"],
        parent: json["parent"],
        familymember: json["familymember"] == null
            ? null
            : Familymember.fromJson(json["familymember"]),
        year: json["year"],
        action: json["action"],
        amount: json["amount"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent,
        "familymember": familymember?.toJson(),
        "year": year,
        "action": action,
        "amount": amount,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt,
      };
}
