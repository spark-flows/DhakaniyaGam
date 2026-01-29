// To parse this JSON data, do
//
//     final resultModel = resultModelFromJson(jsonString);

import 'dart:convert';

   resultModelFromJson(String str) => ResultModel.fromJson(json.decode(str));

String resultModelToJson(ResultModel data) => json.encode(data.toJson());

class ResultModel {
    String? message;
    int? data;
    int? status;
    bool? isSuccess;

    ResultModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        message: json["Message"],
        data: json["Data"],
        status: json["Status"],
        isSuccess: json["IsSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data,
        "Status": status,
        "IsSuccess": isSuccess,
    };
}
