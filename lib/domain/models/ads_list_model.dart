import 'dart:convert';

AdsListModel adsListModelFromJson(String str) =>
    AdsListModel.fromJson(json.decode(str));

class AdsListModel {
  String? message;
  List<AdsListData>? data;
  int? status;
  bool? isSuccess;

  AdsListModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory AdsListModel.fromJson(Map<String, dynamic> json) => AdsListModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<AdsListData>.from(
                json["Data"]!.map((x) => AdsListData.fromJson(x))),
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

class AdsListData {
  String? id;
  String? banner;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  AdsListData({
    this.id,
    this.banner,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory AdsListData.fromJson(Map<String, dynamic> json) => AdsListData(
        id: json["_id"],
        banner: json["banner"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "banner": banner,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}
