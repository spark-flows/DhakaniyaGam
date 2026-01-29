// To parse this JSON data, do
//
//     final loanModel = loanModelFromJson(jsonString);

import 'dart:convert';

import 'package:dhakaniya_gam/domain/models/models.dart';

LoanModel loanModelFromJson(String str) => LoanModel.fromJson(json.decode(str));

String loanModelToJson(LoanModel data) => json.encode(data.toJson());

class LoanModel {
  String? message;
  List<LoanData>? data;
  int? status;
  bool? isSuccess;

  LoanModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) => LoanModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<LoanData>.from(
                json["Data"]!.map((x) => LoanData.fromJson(x))),
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

class LoanData {
  String? id;
  String? parent;
  Familymember? familymember;
  int? year;
  String? action;
  int? createTimestamp;
  DateTime? createdAt;

  LoanData({
    this.id,
    this.parent,
    this.familymember,
    this.year,
    this.action,
    this.createTimestamp,
    this.createdAt,
  });

  factory LoanData.fromJson(Map<String, dynamic> json) => LoanData(
        id: json["_id"],
        parent: json["parent"],
        familymember: json["familymember"] == null
            ? null
            : Familymember.fromJson(json["familymember"]),
        year: json["year"],
        action: json["action"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent,
        "familymember": familymember?.toJson(),
        "year": year,
        "action": action,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}
