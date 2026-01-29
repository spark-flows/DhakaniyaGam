import 'dart:convert';

StationeryCouponModel stationeryCouponModelFromJson(String str) =>
    StationeryCouponModel.fromJson(json.decode(str));

class StationeryCouponModel {
  String? message;
  StationeryCouponData? data;
  int? status;
  bool? isSuccess;

  StationeryCouponModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory StationeryCouponModel.fromJson(Map<String, dynamic> json) =>
      StationeryCouponModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : StationeryCouponData.fromJson(json["Data"]),
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

class StationeryCouponData {
  String? stationeryCouponPath;

  StationeryCouponData({
    this.stationeryCouponPath,
  });

  factory StationeryCouponData.fromJson(Map<String, dynamic> json) =>
      StationeryCouponData(
        stationeryCouponPath: json["stationeryCouponPath"],
      );

  Map<String, dynamic> toJson() => {
        "stationeryCouponPath": stationeryCouponPath,
      };
}
