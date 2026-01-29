import 'dart:convert';

GetResultModel getResultModelFromJson(String str) =>
    GetResultModel.fromJson(json.decode(str));

class GetResultModel {
  String? message;
  List<GetResultData>? data;
  int? status;
  bool? isSuccess;

  GetResultModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetResultModel.fromJson(Map<String, dynamic> json) => GetResultModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<GetResultData>.from(
                json["Data"]!.map((x) => GetResultData.fromJson(x))),
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

class GetResultData {
  String? id;
  String? parent;
  Familymember? familymember;
  int? year;
  String? education;
  String? medium;
  int? totalMarks;
  int? obtainedMarks;
  double? percentage;
  String? action;
  bool? prize;
  bool? stationery;
  int? createTimestamp;
  DateTime? createdAt;

  GetResultData({
    this.id,
    this.parent,
    this.familymember,
    this.year,
    this.education,
    this.medium,
    this.totalMarks,
    this.obtainedMarks,
    this.percentage,
    this.action,
    this.prize,
    this.stationery,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetResultData.fromJson(Map<String, dynamic> json) => GetResultData(
        id: json["_id"],
        parent: json["parent"],
        familymember: json["familymember"] == null
            ? null
            : Familymember.fromJson(json["familymember"]),
        year: json["year"],
        education: json["education"],
        medium: json["medium"],
        totalMarks: json["total_marks"],
        obtainedMarks: json["obtained_marks"],
        percentage: json["percentage"]?.toDouble(),
        action: json["action"],
        prize: json["prize"],
        stationery: json["stationery"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent,
        "familymember": familymember?.toJson(),
        "year": year,
        "education": education,
        "medium": medium,
        "total_marks": totalMarks,
        "obtained_marks": obtainedMarks,
        "percentage": percentage,
        "action": action,
        "prize": prize,
        "stationery": stationery,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class Familymember {
  String? id;
  String? relation;
  String? surname;
  String? name;
  String? fathername;

  Familymember({
    this.id,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
  });

  factory Familymember.fromJson(Map<String, dynamic> json) => Familymember(
        id: json["_id"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "relation": relation,
        "surname": surname,
        "name": name,
        "fathername": fathername,
      };
}
