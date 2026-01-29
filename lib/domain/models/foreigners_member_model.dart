// To parse this JSON data, do
//
//     final foreignersMemberModel = foreignersMemberModelFromJson(jsonString);

import 'dart:convert';

ForeignersMemberModel foreignersMemberModelFromJson(String str) =>
    ForeignersMemberModel.fromJson(json.decode(str));

String foreignersMemberModelToJson(ForeignersMemberModel data) =>
    json.encode(data.toJson());

class ForeignersMemberModel {
  String? message;
  List<ForeignersMemberData>? data;
  int? status;
  bool? isSuccess;

  ForeignersMemberModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory ForeignersMemberModel.fromJson(Map<String, dynamic> json) =>
      ForeignersMemberModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<ForeignersMemberData>.from(
                json["Data"]!.map((x) => ForeignersMemberData.fromJson(x))),
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

class ForeignersMemberData {
  String? id;
  String? parentId;
  ForeignersMemberId? familymemberId;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  ForeignersMemberData({
    this.id,
    this.parentId,
    this.familymemberId,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory ForeignersMemberData.fromJson(Map<String, dynamic> json) =>
      ForeignersMemberData(
        id: json["_id"],
        parentId: json["parentId"],
        familymemberId: json["familymemberId"] == null
            ? null
            : ForeignersMemberId.fromJson(json["familymemberId"]),
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parentId": parentId,
        "familymemberId": familymemberId?.toJson(),
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class ForeignersMemberId {
  String? id;
  String? relation;
  String? surname;
  String? name;
  String? fathername;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  ForeignersMemberId({
    this.id,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory ForeignersMemberId.fromJson(Map<String, dynamic> json) => ForeignersMemberId(
        id: json["_id"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "relation": relation,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}
