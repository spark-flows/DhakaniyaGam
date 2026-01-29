import 'dart:convert';

GetOneDonarModel getOneDonarModelFromJson(String str) =>
    GetOneDonarModel.fromJson(json.decode(str));

class GetOneDonarModel {
  String? message;
  GetOneDonarData? data;
  int? status;
  bool? isSuccess;

  GetOneDonarModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneDonarModel.fromJson(Map<String, dynamic> json) =>
      GetOneDonarModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetOneDonarData.fromJson(json["Data"]),
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

class GetOneDonarData {
  List<MajorDonator>? majorDonators;
  List<MajorDonator>? otherDonators;

  GetOneDonarData({
    this.majorDonators,
    this.otherDonators,
  });

  factory GetOneDonarData.fromJson(Map<String, dynamic> json) =>
      GetOneDonarData(
        majorDonators: json["major_donators"] == null
            ? []
            : List<MajorDonator>.from(
                json["major_donators"]!.map((x) => MajorDonator.fromJson(x))),
        otherDonators: json["other_donators"] == null
            ? []
            : List<MajorDonator>.from(
                json["other_donators"]!.map((x) => MajorDonator.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "major_donators": majorDonators == null
            ? []
            : List<dynamic>.from(majorDonators!.map((x) => x.toJson())),
        "other_donators": otherDonators == null
            ? []
            : List<dynamic>.from(otherDonators!.map((x) => x.toJson())),
      };
}

class MajorDonator {
  String? id;
  String? photo;
  String? englishName;
  String? gujaratiName;
  GetOneDonarFund? village;
  List<Fund>? funds;
  bool? majorDonor;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  MajorDonator({
    this.id,
    this.photo,
    this.englishName,
    this.gujaratiName,
    this.village,
    this.funds,
    this.majorDonor,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory MajorDonator.fromJson(Map<String, dynamic> json) => MajorDonator(
        id: json["_id"],
        photo: json["photo"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        village: json["village"] == null
            ? null
            : GetOneDonarFund.fromJson(json["village"]),
        funds: json["funds"] == null
            ? []
            : List<Fund>.from(json["funds"]!.map((x) => Fund.fromJson(x))),
        majorDonor: json["major_donor"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "photo": photo,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "village": village?.toJson(),
        "funds": funds == null
            ? []
            : List<dynamic>.from(funds!.map((x) => x.toJson())),
        "major_donor": majorDonor,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class Fund {
  String? fund;

  Fund({
    this.fund,
  });

  factory Fund.fromJson(Map<String, dynamic> json) => Fund(
        fund: json["fund"],
      );

  Map<String, dynamic> toJson() => {
        "fund": fund,
      };
}

class GetOneDonarFund {
  String? id;
  String? englishName;
  String? gujaratiName;
  bool? status;

  GetOneDonarFund({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.status,
  });

  factory GetOneDonarFund.fromJson(Map<String, dynamic> json) =>
      GetOneDonarFund(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "status": status,
      };
}

class GetOneDonarName {
  String? englishName;
  String? gujaratiName;

  GetOneDonarName({
    this.englishName,
    this.gujaratiName,
  });

  factory GetOneDonarName.fromJson(Map<String, dynamic> json) =>
      GetOneDonarName(
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "gujarati_name": gujaratiName,
      };
}
