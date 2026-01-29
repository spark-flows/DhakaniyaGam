import 'dart:convert';

import 'package:dhakaniya_gam/domain/domain.dart';

GetOneUserDetailsModel getOneUserDetailsModelFromJson(String str) =>
    GetOneUserDetailsModel.fromJson(json.decode(str));

class GetOneUserDetailsModel {
  String? message;
  GetOneUserDetailsData? data;
  int? status;
  bool? isSuccess;

  GetOneUserDetailsModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneUserDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetOneUserDetailsModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetOneUserDetailsData.fromJson(json["Data"]),
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

class GetOneUserDetailsData {
  MainMember? mainMember;
  List<FamilyMember>? familyMembers;
  List<Foreigner>? foreigners;

  GetOneUserDetailsData({
    this.mainMember,
    this.familyMembers,
    this.foreigners,
  });

  factory GetOneUserDetailsData.fromJson(Map<String, dynamic> json) =>
      GetOneUserDetailsData(
        mainMember: json["main_member"] == null
            ? null
            : MainMember.fromJson(json["main_member"]),
        familyMembers: json["familyMembers"] == null
            ? []
            : List<FamilyMember>.from(
                json["familyMembers"]!.map((x) => FamilyMember.fromJson(x))),
        foreigners: json["foreigners"] == null
            ? []
            : List<Foreigner>.from(
                json["foreigners"]!.map((x) => Foreigner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "main_member": mainMember?.toJson(),
        "familyMembers": familyMembers == null
            ? []
            : List<dynamic>.from(familyMembers!.map((x) => x.toJson())),
        "foreigners": foreigners == null
            ? []
            : List<dynamic>.from(foreigners!.map((x) => x.toJson())),
      };
}

class FamilyMember {
  String? id;
  String? relation;
  String? surname;
  String? name;
  String? fathername;
  String? countryCode;
  String? mobile;
  String? dob;
  String? bloodGroup;
  Business? education;
  String? otherEducation;
  String? schoolCollegeName;
  Business? business;
  String? otherBusiness;
  bool? isMarried;
  String? dom;
  FatherInLaw? fatherInLaw;
  bool? isParent;
  String? parent;
  bool? status;
  int? age;
  String? businessDetails;
  FamilyMemberCountryWiseContact? countryWiseContact;

  FamilyMember({
    this.id,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
    this.countryCode,
    this.mobile,
    this.dob,
    this.bloodGroup,
    this.education,
    this.otherEducation,
    this.schoolCollegeName,
    this.business,
    this.otherBusiness,
    this.isMarried,
    this.dom,
    this.fatherInLaw,
    this.isParent,
    this.parent,
    this.status,
    this.age,
    this.businessDetails,
    this.countryWiseContact,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
        id: json["_id"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
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
        isMarried: json["is_married"],
        dom: json["dom"],
        fatherInLaw: json["father_in_law"] == null
            ? null
            : FatherInLaw.fromJson(json["father_in_law"]),
        isParent: json["is_parent"],
        parent: json["parent"],
        status: json["status"],
        age: json["age"],
        businessDetails: json["business_details"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : FamilyMemberCountryWiseContact.fromJson(
                json["country_wise_contact"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "relation": relation,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "countryCode": countryCode,
        "mobile": mobile,
        "dob": dob,
        "blood_group": bloodGroup,
        "education": education?.toJson(),
        "other_education": otherEducation,
        "school_college_name": schoolCollegeName,
        "business": business?.toJson(),
        "other_business": otherBusiness,
        "is_married": isMarried,
        "dom": dom,
        "father_in_law": fatherInLaw?.toJson(),
        "is_parent": isParent,
        "parent": parent,
        "status": status,
        "age": age,
        "business_details": businessDetails,
        "country_wise_contact": countryWiseContact?.toJson(),
      };
}

class FamilyMemberCountryWiseContact {
  FamilyMemberCountryWiseContact();

  factory FamilyMemberCountryWiseContact.fromJson(Map<String, dynamic> json) =>
      FamilyMemberCountryWiseContact();

  Map<String, dynamic> toJson() => {};
}

// class Business {
//     String? id;
//     String? englishName;
//     String? gujaratiName;

//     Business({
//         this.id,
//         this.englishName,
//         this.gujaratiName,
//     });

//     factory Business.fromJson(Map<String, dynamic> json) => Business(
//         id: json["_id"],
//         englishName: json["english_name"],
//         gujaratiName: json["gujarati_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "english_name": englishName,
//         "gujarati_name": gujaratiName,
//     };
// }

// class FatherInLaw {
//     String? surname;
//     String? name;
//     String? fathername;
//     String? village;
//     String? taluka;
//     String? district;

//     FatherInLaw({
//         this.surname,
//         this.name,
//         this.fathername,
//         this.village,
//         this.taluka,
//         this.district,
//     });

//     factory FatherInLaw.fromJson(Map<String, dynamic> json) => FatherInLaw(
//         surname: json["surname"],
//         name: json["name"],
//         fathername: json["fathername"],
//         village: json["village"],
//         taluka: json["taluka"],
//         district: json["district"],
//     );

//     Map<String, dynamic> toJson() => {
//         "surname": surname,
//         "name": name,
//         "fathername": fathername,
//         "village": village,
//         "taluka": taluka,
//         "district": district,
//     };
// }

class Foreigner {
  String? id;
  String? parentId;
  FamilymemberId? familymemberId;
  Mobile? mobile;
  String? foreignerFor;
  Business? education;
  String? universityName;
  Business? business;
  String? country;
  String? city;
  int? from;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  Foreigner({
    this.id,
    this.parentId,
    this.familymemberId,
    this.mobile,
    this.foreignerFor,
    this.education,
    this.universityName,
    this.business,
    this.country,
    this.city,
    this.from,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory Foreigner.fromJson(Map<String, dynamic> json) => Foreigner(
        id: json["_id"],
        parentId: json["parentId"],
        familymemberId: json["familymemberId"] == null
            ? null
            : FamilymemberId.fromJson(json["familymemberId"]),
        mobile: json["mobile"] == null ? null : Mobile.fromJson(json["mobile"]),
        foreignerFor: json["for"],
        education: json["education"] == null
            ? null
            : Business.fromJson(json["education"]),
        universityName: json["university_name"],
        business: json["business"] == null
            ? null
            : Business.fromJson(json["business"]),
        country: json["country"],
        city: json["city"],
        from: json["from"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parentId": parentId,
        "familymemberId": familymemberId?.toJson(),
        "mobile": mobile?.toJson(),
        "for": foreignerFor,
        "education": education?.toJson(),
        "university_name": universityName,
        "business": business?.toJson(),
        "country": country,
        "city": city,
        "from": from,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class FamilymemberId {
  String? id;
  String? relation;
  String? surname;
  String? name;
  String? fathername;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  FamilymemberId({
    this.id,
    this.relation,
    this.surname,
    this.name,
    this.fathername,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory FamilymemberId.fromJson(Map<String, dynamic> json) => FamilymemberId(
        id: json["_id"],
        relation: json["relation"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "relation": relation,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class Mobile {
  String? countryCode;
  String? isoCode;
  String? number;

  Mobile({
    this.countryCode,
    this.isoCode,
    this.number,
  });

  factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        countryCode: json["country_code"],
        isoCode: json["iso_code"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "iso_code": isoCode,
        "number": number,
      };
}

class MainMember {
  String? id;
  String? relation;
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
  bool? isMarried;
  String? dom;
  FatherInLaw? fatherInLaw;
  bool? isParent;
  dynamic parent;
  bool? status;
  String? userCode;
  String? profilePic;
  OptionalCountryWiseContactClass? countryWiseContact;
  String? optionalCountryCode;
  String? optionalMobile;
  OptionalCountryWiseContactClass? optionalCountryWiseContact;
  String? email;
  int? age;
  String? currentAddress;
  String? firmName;
  String? businessAddress;
  String? businessDetails;
  String? house;
  List<String>? mediclaims;
  String? other;
  bool? mobileverified;
  bool? paymentStatus;
  bool? isApproved;
  int? createTimestamp;
  int? lastloginAt;
  String? residentialType;

  MainMember({
    this.id,
    this.relation,
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
    this.isMarried,
    this.dom,
    this.fatherInLaw,
    this.isParent,
    this.parent,
    this.status,
    this.userCode,
    this.profilePic,
    this.countryWiseContact,
    this.optionalCountryCode,
    this.optionalMobile,
    this.optionalCountryWiseContact,
    this.email,
    this.age,
    this.currentAddress,
    this.firmName,
    this.businessAddress,
    this.businessDetails,
    this.house,
    this.mediclaims,
    this.other,
    this.mobileverified,
    this.paymentStatus,
    this.isApproved,
    this.createTimestamp,
    this.residentialType,
    this.lastloginAt,
  });

  factory MainMember.fromJson(Map<String, dynamic> json) => MainMember(
        id: json["_id"],
        relation: json["relation"],
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
        isMarried: json["is_married"],
        dom: json["dom"],
        fatherInLaw: json["father_in_law"] == null
            ? null
            : FatherInLaw.fromJson(json["father_in_law"]),
        isParent: json["is_parent"],
        parent: json["parent"],
        status: json["status"],
        userCode: json["user_code"],
        profilePic: json["profile_pic"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : OptionalCountryWiseContactClass.fromJson(
                json["country_wise_contact"]),
        optionalCountryCode: json["optional_countryCode"],
        optionalMobile: json["optional_mobile"],
        optionalCountryWiseContact:
            json["optional_country_wise_contact"] == null
                ? null
                : OptionalCountryWiseContactClass.fromJson(
                    json["optional_country_wise_contact"]),
        email: json["email"],
        age: json["age"],
        currentAddress: json["current_address"],
        firmName: json["firm_name"] ?? " -- ",
        businessAddress: json["business_address"] ?? " -- ",
        businessDetails: json["business_details"] ?? " -- ",
        house: json["house"] ?? " -- ",
        mediclaims: json["mediclaims"] == null
            ? []
            : List<String>.from(json["mediclaims"]!.map((x) => x)),
        other: json["other"],
        mobileverified: json["mobileverified"],
        paymentStatus: json["payment_status"],
        isApproved: json["is_approved"],
        createTimestamp: json["create_timestamp"],
        residentialType: json["residential_type"],
        lastloginAt: json["lastloginAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "relation": relation,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "village": village?.toJson(),
        "countryCode": countryCode,
        "mobile": mobile,
        "dob": dob,
        "blood_group": bloodGroup,
        "education": education?.toJson(),
        "other_education": otherEducation,
        "school_college_name": schoolCollegeName,
        "business": business?.toJson(),
        "other_business": otherBusiness,
        "is_married": isMarried,
        "dom": dom,
        "father_in_law": fatherInLaw?.toJson(),
        "is_parent": isParent,
        "parent": parent,
        "status": status,
        "user_code": userCode,
        "profile_pic": profilePic,
        "country_wise_contact": countryWiseContact?.toJson(),
        "optional_countryCode": optionalCountryCode,
        "optional_mobile": optionalMobile,
        "optional_country_wise_contact": optionalCountryWiseContact?.toJson(),
        "email": email,
        "age": age,
        "current_address": currentAddress,
        "firm_name": firmName,
        "business_address": businessAddress,
        "business_details": businessDetails,
        "house": house,
        "mediclaims": mediclaims == null
            ? []
            : List<dynamic>.from(mediclaims!.map((x) => x)),
        "other": other,
        "mobileverified": mobileverified,
        "payment_status": paymentStatus,
        "is_approved": isApproved,
        "create_timestamp": createTimestamp,
        "lastloginAt": lastloginAt,
        "residential_type": residentialType,
      };
}

class OptionalCountryWiseContactClass {
  String? number;
  String? internationalNumber;
  String? nationalNumber;
  String? e164Number;
  String? countryCode;
  String? dialCode;

  OptionalCountryWiseContactClass({
    this.number,
    this.internationalNumber,
    this.nationalNumber,
    this.e164Number,
    this.countryCode,
    this.dialCode,
  });

  factory OptionalCountryWiseContactClass.fromJson(Map<String, dynamic> json) =>
      OptionalCountryWiseContactClass(
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
