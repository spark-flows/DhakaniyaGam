import 'dart:convert';

VillageListModel villageListModelFromJson(String str) =>
    VillageListModel.fromJson(json.decode(str));

String villageListModelToJson(VillageListModel data) =>
    json.encode(data.toJson());

class VillageListModel {
  String? message;
  List<VillageDatum>? data;
  int? status;
  bool? isSuccess;

  VillageListModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory VillageListModel.fromJson(Map<String, dynamic> json) =>
      VillageListModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<VillageDatum>.from(
                json["Data"]!.map((x) => VillageDatum.fromJson(x))),
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

class VillageDatum {
  String? id;
  String? englishName;
  String? gujaratiName;
  String? code;
  bool? status;
  DateTime? createdAt;

  VillageDatum({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.code,
    this.status,
    this.createdAt,
  });

  factory VillageDatum.fromJson(Map<String, dynamic> json) => VillageDatum(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        code: json["code"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "code": code,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
      };
}
