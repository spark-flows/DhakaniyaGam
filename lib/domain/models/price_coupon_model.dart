import 'dart:convert';

PriceCouponModel priceCouponModelFromJson(String str) =>
    PriceCouponModel.fromJson(json.decode(str));

class PriceCouponModel {
  String? message;
  PriceCouponData? data;
  int? status;
  bool? isSuccess;

  PriceCouponModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory PriceCouponModel.fromJson(Map<String, dynamic> json) =>
      PriceCouponModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : PriceCouponData.fromJson(json["Data"]),
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

class PriceCouponData {
  String? prizeCouponPath;

  PriceCouponData({
    this.prizeCouponPath,
  });

  factory PriceCouponData.fromJson(Map<String, dynamic> json) =>
      PriceCouponData(
        prizeCouponPath: json["prizeCouponPath"],
      );

  Map<String, dynamic> toJson() => {
        "prizeCouponPath": prizeCouponPath,
      };
}
