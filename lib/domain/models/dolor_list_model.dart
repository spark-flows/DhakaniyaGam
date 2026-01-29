import 'dart:convert';

DonarListModel donarListModelFromJson(String str) =>
    DonarListModel.fromJson(json.decode(str));

class DonarListModel {
  String? message;
  List<DonarListData>? data;
  int? status;
  bool? isSuccess;

  DonarListModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory DonarListModel.fromJson(Map<String, dynamic> json) => DonarListModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<DonarListData>.from(
                json["Data"]!.map((x) => DonarListData.fromJson(x))),
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

class DonarListData {
  String? id;
  String? englishName;
  String? gujaratiName;
  bool? status;
  int? createTimestamp;
  String? createdAt;

  DonarListData({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory DonarListData.fromJson(Map<String, dynamic> json) => DonarListData(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt,
      };
}
