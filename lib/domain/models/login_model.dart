import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  LoginData? data;
  int? status;
  bool? isSuccess;

  LoginModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["Message"],
        data: json["Data"] == null || json["Data"] == 0
            ? null
            : LoginData.fromJson(json["Data"]),
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

class LoginData {
  String? key;

  LoginData({
    this.key,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
      };
}
