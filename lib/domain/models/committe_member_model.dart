import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

CommitteeMemberModel committeeMemberModelFromJson(String str) => CommitteeMemberModel.fromJson(json.decode(str));

class CommitteeMemberModel {
    String? message;
    CommitteeMemberData? data;
    int? status;
    bool? isSuccess;

    CommitteeMemberModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory CommitteeMemberModel.fromJson(Map<String, dynamic> json) => CommitteeMemberModel(
        message: json["Message"],
        data: json["Data"] == null ? null : CommitteeMemberData.fromJson(json["Data"]),
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

class CommitteeMemberData {
    List<CommitteeMemberDocs>? docs;
    int? totalDocs;
    int? limit;
    int? totalPages;
    int? page;
    int? pagingCounter;
    bool? hasPrevPage;
    bool? hasNextPage;
    dynamic prevPage;
    dynamic nextPage;

    CommitteeMemberData({
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

    factory CommitteeMemberData.fromJson(Map<String, dynamic> json) => CommitteeMemberData(
        docs: json["docs"] == null ? [] : List<CommitteeMemberDocs>.from(json["docs"]!.map((x) => CommitteeMemberDocs.fromJson(x))),
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
        "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
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

class CommitteeMemberDocs {
    String? id;
    User? user;
    Village? village;
    String? designation;
    bool? status;
    int? createTimestamp;
    DateTime? createdAt;

    CommitteeMemberDocs({
        this.id,
        this.user,
        this.village,
        this.designation,
        this.status,
        this.createTimestamp,
        this.createdAt,
    });

    factory CommitteeMemberDocs.fromJson(Map<String, dynamic> json) => CommitteeMemberDocs(
        id: json["_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        village: json["village"] == null ? null : Village.fromJson(json["village"]),
        designation: json["designation"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "village": village?.toJson(),
        "designation": designation,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
    };
}

class User {
    String? id;
    String? surname;
    String? name;
    String? fathername;
    String? countryCode;
    String? mobile;
    String? profilePic;
    CountryWiseContact? countryWiseContact;

    User({
        this.id,
        this.surname,
        this.name,
        this.fathername,
        this.countryCode,
        this.mobile,
        this.profilePic,
        this.countryWiseContact,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        countryCode: json["countryCode"],
        mobile: json["mobile"],
        profilePic: json["profile_pic"],
        countryWiseContact: json["country_wise_contact"] == null ? null : CountryWiseContact.fromJson(json["country_wise_contact"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "countryCode": countryCode,
        "mobile": mobile,
        "profile_pic": profilePic,
        "country_wise_contact": countryWiseContact?.toJson(),
    };
}

