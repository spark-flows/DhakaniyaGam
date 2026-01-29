import 'dart:convert';

VerifyModel verifyModelFromJson(String str) =>
    VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  String? message;
  VerifyData? data;
  int? status;
  bool? isSuccess;

  VerifyModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        message: json["Message"],
        data: json["Data"] == null || json["Data"] == 0
            ? null
            : VerifyData.fromJson(json["Data"]),
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

class VerifyData {
  String? accessToken;
  bool? paymentStatus;
  bool? isApproved;
  String? channelid;

  VerifyData({
    this.accessToken,
    this.paymentStatus,
    this.isApproved,
    this.channelid,
  });

  factory VerifyData.fromJson(Map<String, dynamic> json) => VerifyData(
        accessToken: json["accessToken"],
        paymentStatus: json["payment_status"],
        isApproved: json["is_approved"],
        channelid: json["channelid"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "payment_status": paymentStatus,
        "is_approved": isApproved,
        "channelid": channelid,
      };
}
