import 'dart:convert';

CommitteeMembersModel committeeMembersModelFromJson(String str) =>
    CommitteeMembersModel.fromJson(json.decode(str));

class CommitteeMembersModel {
  String? message;
  List<CommitteeMembersDatum>? data;
  int? status;
  bool? isSuccess;

  CommitteeMembersModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory CommitteeMembersModel.fromJson(Map<String, dynamic> json) =>
      CommitteeMembersModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<CommitteeMembersDatum>.from(
                json["Data"]!.map((x) => CommitteeMembersDatum.fromJson(x))),
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

class CommitteeMembersDatum {
  String? id;
  CommitteeMembersUser? user;
  CommitteeMembersVillage? village;
  String? designation;
  bool? status;
  DateTime? createdAt;
  int? createTimestamp;

  CommitteeMembersDatum({
    this.id,
    this.user,
    this.village,
    this.designation,
    this.status,
    this.createdAt,
    this.createTimestamp,
  });

  factory CommitteeMembersDatum.fromJson(Map<String, dynamic> json) =>
      CommitteeMembersDatum(
        id: json["_id"],
        user: json["user"] == null ? null : CommitteeMembersUser.fromJson(json["user"]),
        village: json["village"] == null
            ? null
            : CommitteeMembersVillage.fromJson(json["village"]),
        designation: json["designation"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "village": village?.toJson(),
        "designation": designation,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class CommitteeMembersVillage {
  String? id;
  String? englishName;
  String? gujaratiName;
  String? code;
  bool? status;
  DateTime? createdAt;

  CommitteeMembersVillage({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.code,
    this.status,
    this.createdAt,
  });

  factory CommitteeMembersVillage.fromJson(Map<String, dynamic> json) =>
      CommitteeMembersVillage(
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

class CommitteeMembersUser {
  String? id;
  String? surname;
  String? name;
  String? fathername;
  bool? status;
  String? userCode;
  bool? isApproved;
  int? createTimestamp;
  DateTime? createdAt;
  int? userNumber;

  CommitteeMembersUser({
    this.id,
    this.surname,
    this.name,
    this.fathername,
    this.status,
    this.userCode,
    this.isApproved,
    this.createTimestamp,
    this.createdAt,
    this.userNumber,
  });

  factory CommitteeMembersUser.fromJson(Map<String, dynamic> json) => CommitteeMembersUser(
        id: json["_id"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        status: json["status"],
        userCode: json["user_code"],
        isApproved: json["is_approved"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        userNumber: json["user_number"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "status": status,
        "user_code": userCode,
        "is_approved": isApproved,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        "user_number": userNumber,
      };
}
