// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  String? message;
  GetProfileData? data;
  int? status;
  bool? isSuccess;

  GetProfileModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        message: json["Message"],
        data:
            json["Data"] == null ? null : GetProfileData.fromJson(json["Data"]),
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

class GetProfileData {
  String? id;
  String? surname;
  String? name;
  String? fathername;
  Business? village;
  String? countryCode;
  String? mobile;
  String? dob;
  String? bloodGroup;
  Business? education;
  String? otherEducation;
  String? schoolCollegeName;
  Business? business;
  String? otherBusiness;
  String? firmName;
  String? businessAddress;
  String? businessDetails;
  String? dom;
  String? villageRepresentative;
  bool? status;
  dynamic createdBy;
  String? updatedBy;
  String? profilePic;
  CountryWiseContact? countryWiseContact;
  String? email;
  String? currentAddress;
  String? frontAadhara;
  String? backAadhara;
  bool? mobileverified;
  bool? isApproved;
  int? createTimestamp;
  String? otpVerifyKey;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? channelid;
  String? fcmToken;
  int? lastloginAt;
  String? userCode;
  FatherInLaw? fatherInLaw;
  // bool? isMarried;
  List<String>? mediclaims;
  String? optionalCountryCode;
  CountryWiseContact? optionalCountryWiseContact;
  String? optionalMobile;
  String? other;
  String? residentialType;
  int? userNumber;
  int? notificationCount;

  GetProfileData({
    this.id,
    this.surname,
    this.name,
    this.fathername,
    this.village,
    this.countryCode,
    this.mobile,
    this.dob,
    this.bloodGroup,
    this.education,
    this.otherEducation,
    this.schoolCollegeName,
    this.business,
    this.otherBusiness,
    this.firmName,
    this.businessAddress,
    this.businessDetails,
    this.dom,
    this.villageRepresentative,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.profilePic,
    this.countryWiseContact,
    this.email,
    this.currentAddress,
    this.frontAadhara,
    this.backAadhara,
    this.mobileverified,
    this.isApproved,
    this.createTimestamp,
    this.otpVerifyKey,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.channelid,
    this.fcmToken,
    this.lastloginAt,
    this.userCode,
    this.fatherInLaw,
    // this.isMarried,
    this.mediclaims,
    this.optionalCountryCode,
    this.optionalCountryWiseContact,
    this.optionalMobile,
    this.other,
    this.residentialType,
    this.userNumber,
    this.notificationCount,
  });

  factory GetProfileData.fromJson(Map<String, dynamic> json) => GetProfileData(
        id: json["_id"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        village:
            json["village"] == null ? null : Business.fromJson(json["village"]),
        countryCode: json["countryCode"],
        mobile: json["mobile"],
        dob: json["dob"],
        bloodGroup: json["blood_group"],
        education: json["education"] == null
            ? null
            : Business.fromJson(json["education"]),
        otherEducation: json["other_education"],
        schoolCollegeName: json["school_college_name"],
        business: json["business"] == null
            ? null
            : Business.fromJson(json["business"]),
        otherBusiness: json["other_business"],
        firmName: json["firm_name"],
        businessAddress: json["business_address"],
        businessDetails: json["business_details"],
        dom: json["dom"],
        villageRepresentative: json["village_representative"],
        status: json["status"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        profilePic: json["profile_pic"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : CountryWiseContact.fromJson(json["country_wise_contact"]),
        email: json["email"],
        currentAddress: json["current_address"],
        frontAadhara: json["front_aadhara"],
        backAadhara: json["back_aadhara"],
        mobileverified: json["mobileverified"],
        isApproved: json["is_approved"],
        createTimestamp: json["create_timestamp"],
        otpVerifyKey: json["otpVerifyKey"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        channelid: json["channelid"],
        fcmToken: json["fcm_token"],
        lastloginAt: json["lastloginAt"],
        userCode: json["user_code"],
        fatherInLaw: json["father_in_law"] == null
            ? null
            : FatherInLaw.fromJson(json["father_in_law"]),
        // isMarried: json["is_married"],
        mediclaims: json["mediclaims"] == null
            ? []
            : List<String>.from(json["mediclaims"]!.map((x) => x)),
        optionalCountryCode: json["optional_countryCode"],
        optionalCountryWiseContact:
            json["optional_country_wise_contact"] == null
                ? null
                : CountryWiseContact.fromJson(
                    json["optional_country_wise_contact"]),
        optionalMobile: json["optional_mobile"],
        other: json["other"],
        residentialType: json["residential_type"],
        userNumber: json["user_number"],
        notificationCount: json["notification_count"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "village": village,
        "countryCode": countryCode,
        "mobile": mobile,
        "dob": dob,
        "blood_group": bloodGroup,
        "education": education,
        "other_education": otherEducation,
        "school_college_name": schoolCollegeName,
        "business": business,
        "other_business": otherBusiness,
        "firm_name": firmName,
        "business_address": businessAddress,
        "business_details": businessDetails,
        "dom": dom,
        "village_representative": villageRepresentative,
        "status": status,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "profile_pic": profilePic,
        "country_wise_contact": countryWiseContact?.toJson(),
        "email": email,
        "current_address": currentAddress,
        "front_aadhara": frontAadhara,
        "back_aadhara": backAadhara,
        "mobileverified": mobileverified,
        "is_approved": isApproved,
        "create_timestamp": createTimestamp,
        "otpVerifyKey": otpVerifyKey,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "channelid": channelid,
        "fcm_token": fcmToken,
        "lastloginAt": lastloginAt,
        "user_code": userCode,
        "father_in_law": fatherInLaw?.toJson(),
        // "is_married": isMarried,
        "mediclaims": mediclaims == null
            ? []
            : List<dynamic>.from(mediclaims!.map((x) => x)),
        "optional_countryCode": optionalCountryCode,
        "optional_country_wise_contact": optionalCountryWiseContact?.toJson(),
        "optional_mobile": optionalMobile,
        "other": other,
        "residential_type": residentialType,
        "user_number": userNumber,
        "notification_count": notificationCount,
      };
}

class Business {
  String? id;
  String? englishName;
  String? gujaratiName;
  bool? status;
  DateTime? createdAt;
  String? code;

  Business({
    this.id,
    this.englishName,
    this.gujaratiName,
    this.status,
    this.createdAt,
    this.code,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["_id"],
        englishName: json["english_name"],
        gujaratiName: json["gujarati_name"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "english_name": englishName,
        "gujarati_name": gujaratiName,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "code": code,
      };
}

class CountryWiseContact {
  String? number;
  String? internationalNumber;
  String? nationalNumber;
  String? e164Number;
  String? countryCode;
  String? dialCode;

  CountryWiseContact({
    this.number,
    this.internationalNumber,
    this.nationalNumber,
    this.e164Number,
    this.countryCode,
    this.dialCode,
  });

  factory CountryWiseContact.fromJson(Map<String, dynamic> json) =>
      CountryWiseContact(
        number: json["number"],
        internationalNumber: json["internationalNumber"],
        nationalNumber: json["nationalNumber"],
        e164Number: json["e164Number"],
        countryCode: json["countryCode"],
        dialCode: json["dialCode"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "internationalNumber": internationalNumber,
        "nationalNumber": nationalNumber,
        "e164Number": e164Number,
        "countryCode": countryCode,
        "dialCode": dialCode,
      };
}

class FatherInLaw {
  String? surname;
  String? name;
  String? fathername;
  String? village;
  String? taluka;
  String? district;

  FatherInLaw({
    this.surname,
    this.name,
    this.fathername,
    this.village,
    this.taluka,
    this.district,
  });

  factory FatherInLaw.fromJson(Map<String, dynamic> json) => FatherInLaw(
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        village: json["village"],
        taluka: json["taluka"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "village": village,
        "taluka": taluka,
        "district": district,
      };
}
