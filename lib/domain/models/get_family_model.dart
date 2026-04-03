// To parse this JSON data, do
//
//     final getFamilyModel = getFamilyModelFromJson(jsonString);

import 'dart:convert';

GetFamilyModel getFamilyModelFromJson(String str) =>
    GetFamilyModel.fromJson(json.decode(str));

String getFamilyModelToJson(GetFamilyModel data) => json.encode(data.toJson());

class GetFamilyModel {
  String? message;
  List<GetFamilyData>? data;
  int? status;
  bool? isSuccess;

  GetFamilyModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetFamilyModel.fromJson(Map<String, dynamic> json) => GetFamilyModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<GetFamilyData>.from(
                json["Data"]!.map((x) => GetFamilyData.fromJson(x))),
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

class GetFamilyData {
  String? id;
  String? parent;
  String? relation;
  String? surname;
  String? name;
  String? fathername;
  dynamic status;
  int? createTimestamp;
  String? createdAt;

  GetFamilyData({
    this.id,
    this.parent,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetFamilyData.fromJson(Map<String, dynamic> json) => GetFamilyData(
        id: json["_id"],
        parent: json["parent"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent,
        "relation": relation,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt,
      };
}
