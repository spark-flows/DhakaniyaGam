import 'dart:convert';

GetServicesModel getServicesModelFromJson(String str) =>
    GetServicesModel.fromJson(json.decode(str));

class GetServicesModel {
  String? message;
  List<GetServicesData>? data;
  int? status;
  bool? isSuccess;

  GetServicesModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetServicesModel.fromJson(Map<String, dynamic> json) =>
      GetServicesModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<GetServicesData>.from(
                json["Data"]!.map((x) => GetServicesData.fromJson(x))),
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

class GetServicesData {
  String? id;
  String? service;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  GetServicesData({
    this.id,
    this.service,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetServicesData.fromJson(Map<String, dynamic> json) =>
      GetServicesData(
        id: json["_id"],
        service: json["service"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "service": service,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}
