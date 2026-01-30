// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  Data? data;
  int? status;
  bool? isSuccess;

  LoginModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  LoginModel copyWith({
    String? message,
    Data? data,
    int? status,
    bool? isSuccess,
  }) =>
      LoginModel(
        message: message ?? this.message,
        data: data ?? this.data,
        status: status ?? this.status,
        isSuccess: isSuccess ?? this.isSuccess,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["Message"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
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

class Data {
  String? accessToken;
  bool? isApproved;
  bool? isCommitteeMember;
  String? channelid;

  Data({
    this.accessToken,
    this.isApproved,
    this.isCommitteeMember,
    this.channelid,
  });

  Data copyWith({
    String? accessToken,
    bool? isApproved,
    bool? isCommitteeMember,
    String? channelid,
  }) =>
      Data(
        accessToken: accessToken ?? this.accessToken,
        isApproved: isApproved ?? this.isApproved,
        isCommitteeMember: isCommitteeMember ?? this.isCommitteeMember,
        channelid: channelid ?? this.channelid,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        isApproved: json["is_approved"],
        isCommitteeMember: json["isCommitteeMember"],
        channelid: json["channelid"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "is_approved": isApproved,
        "isCommitteeMember": isCommitteeMember,
        "channelid": channelid,
      };
}
