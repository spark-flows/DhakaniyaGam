import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

QualifiedPrizeModel qualifiedPrizeModelFromJson(String str) =>
    QualifiedPrizeModel.fromJson(json.decode(str));

class QualifiedPrizeModel {
  String? message;
  QualifiedPrizeData? data;
  int? status;
  bool? isSuccess;

  QualifiedPrizeModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory QualifiedPrizeModel.fromJson(Map<String, dynamic> json) =>
      QualifiedPrizeModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : QualifiedPrizeData.fromJson(json["Data"]),
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

class QualifiedPrizeData {
  List<QualifiedPrizeDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  QualifiedPrizeData({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory QualifiedPrizeData.fromJson(Map<String, dynamic> json) =>
      QualifiedPrizeData(
        docs: json["docs"] == null
            ? []
            : List<QualifiedPrizeDoc>.from(
                json["docs"]!.map((x) => QualifiedPrizeDoc.fromJson(x))),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "docs": docs == null
            ? []
            : List<dynamic>.from(docs!.map((x) => x.toJson())),
        "totalDocs": totalDocs,
        "limit": limit,
        "totalPages": totalPages,
        "page": page,
        "pagingCounter": pagingCounter,
        "hasPrevPage": hasPrevPage,
        "hasNextPage": hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage,
      };
}

class QualifiedPrizeDoc {
  Education? education;
  List<Student>? students;

  QualifiedPrizeDoc({
    this.education,
    this.students,
  });

  factory QualifiedPrizeDoc.fromJson(Map<String, dynamic> json) =>
      QualifiedPrizeDoc(
        education: json["education"] == null
            ? null
            : Education.fromJson(json["education"]),
        students: json["students"] == null
            ? []
            : List<Student>.from(
                json["students"]!.map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "education": education?.toJson(),
        "students": students == null
            ? []
            : List<dynamic>.from(students!.map((x) => x.toJson())),
      };
}

class Student {
  String? id;
  FamilymemberQulity? parent;
  FamilymemberQulity? familymember;
  int? year;
  String? medium;
  int? totalMarks;
  int? obtainedMarks;
  double? percentage;
  String? result;
  String? action;
  bool? stationery;
  bool? prize;
  int? createTimestamp;
  String? createdAt;
  String? studentId;

  Student({
    this.id,
    this.parent,
    this.familymember,
    this.year,
    this.medium,
    this.totalMarks,
    this.obtainedMarks,
    this.percentage,
    this.result,
    this.action,
    this.stationery,
    this.prize,
    this.createTimestamp,
    this.createdAt,
    this.studentId,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"],
        parent: json["parent"] == null
            ? null
            : FamilymemberQulity.fromJson(json["parent"]),
        familymember: json["familymember"] == null
            ? null
            : FamilymemberQulity.fromJson(json["familymember"]),
        year: json["year"],
        medium: json["medium"],
        totalMarks: json["total_marks"],
        obtainedMarks: json["obtained_marks"],
        percentage: json["percentage"]?.toDouble(),
        result: json["result"],
        action: json["action"],
        stationery: json["stationery"],
        prize: json["prize"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"],
        studentId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent?.toJson(),
        "familymember": familymember?.toJson(),
        "year": year,
        "medium": medium,
        "total_marks": totalMarks,
        "obtained_marks": obtainedMarks,
        "percentage": percentage,
        "result": result,
        "action": action,
        "stationery": stationery,
        "prize": prize,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt,
        "id": studentId,
      };
}

class FamilymemberQulity {
  String? id;
  String? relation;
  String? surname;
  String? name;
  String? fathername;
  String? mobile;

  FamilymemberQulity({
    this.id,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
    this.mobile,
  });

  factory FamilymemberQulity.fromJson(Map<String, dynamic> json) =>
      FamilymemberQulity(
        id: json["_id"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "relation": relation,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "mobile": mobile,
      };
}
