import 'dart:convert';

EducationModel educationModelFromJson(String str) =>
    EducationModel.fromJson(json.decode(str));

class EducationModel {
  String? message;
  List<EducationDatas>? data;
  int? status;
  bool? isSuccess;

  EducationModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<EducationDatas>.from(
                json["Data"]!.map((x) => EducationDatas.fromJson(x))),
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

class EducationDatas {
  String? id;
  String? englishName;
  String? gujaratiName;
  bool? status;
  String? createdAt;

  EducationDatas({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.status,
    this.createdAt,
  });

  factory EducationDatas.fromJson(Map<String, dynamic> json) => EducationDatas(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        status: json["status"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "status": status,
        "createdAt": createdAt,
      };
}
