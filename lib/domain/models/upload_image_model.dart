import 'dart:convert';

UploadImageModel uploadImageModelFromJson(String str) =>
    UploadImageModel.fromJson(json.decode(str));
class UploadImageModel {
  String? message;
  UploadImageData? data;
  int? status;
  bool? isSuccess;

  UploadImageModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) =>
      UploadImageModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : UploadImageData.fromJson(json["Data"]),
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

class UploadImageData {
  String? path;

  UploadImageData({
    this.path,
  });

  factory UploadImageData.fromJson(Map<String, dynamic> json) =>
      UploadImageData(
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
      };
}
