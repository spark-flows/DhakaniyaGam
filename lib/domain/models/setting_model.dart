// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

SettingModel settingModelFromJson(String str) => SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
    String? message;
    SettingData? data;
    int? status;
    bool? isSuccess;

    SettingModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        message: json["Message"],
        data: json["Data"] == null ? null : SettingData.fromJson(json["Data"]),
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

class SettingData {
    bool? resultOn;
    bool? services;

    SettingData({
        this.resultOn,
        this.services,
    });

    factory SettingData.fromJson(Map<String, dynamic> json) => SettingData(
        resultOn: json["result_on"],
        services: json["services"],
    );

    Map<String, dynamic> toJson() => {
        "result_on": resultOn,
        "services": services,
    };
}
