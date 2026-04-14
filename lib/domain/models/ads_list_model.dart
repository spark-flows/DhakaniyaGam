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
  String? startDate;
  String? endDate;
  String? link;
  List<String>? otherImages;
  String? createdAt;

  AdsListData({
    this.id,
    this.banner,
    this.status,
    this.createTimestamp,
    this.startDate,
    this.endDate,
    this.link,
    this.otherImages,
    this.createdAt,
  });

  factory AdsListData.fromJson(Map<String, dynamic> json) => AdsListData(
        id: json["_id"],
        banner: json["banner"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        link: json["link"],
        otherImages: json["other_images"] == null
            ? []
            : List<String>.from(json["other_images"]!.map((x) => x)),
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "banner": banner,
        "status": status,
        "create_timestamp": createTimestamp,
        "startDate": startDate,
        "endDate": endDate,
        "link": link,
        "other_images": otherImages == null
            ? []
            : List<dynamic>.from(otherImages!.map((x) => x)),
        "createdAt": createdAt,
      };
}
