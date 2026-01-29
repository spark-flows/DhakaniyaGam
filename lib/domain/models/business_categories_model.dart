import 'dart:convert';

BusinessCategoriesModel businessCategoriesModelFromJson(String str) =>
    BusinessCategoriesModel.fromJson(json.decode(str));

class BusinessCategoriesModel {
  String? message;
  List<BusinessCategoriesDatum>? data;
  int? status;
  bool? isSuccess;

  BusinessCategoriesModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory BusinessCategoriesModel.fromJson(Map<String, dynamic> json) =>
      BusinessCategoriesModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<BusinessCategoriesDatum>.from(json["Data"]!.map((x) => BusinessCategoriesDatum.fromJson(x))),
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

class BusinessCategoriesDatum {
  String? id;
  String? englishName;
  String? gujaratiName;
  bool? status;
  DateTime? createdAt;

  BusinessCategoriesDatum({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.status,
    this.createdAt,
  });

  factory BusinessCategoriesDatum.fromJson(Map<String, dynamic> json) => BusinessCategoriesDatum(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
      };
}
