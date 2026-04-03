// coverage:ignore-file
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dhakaniya_gam/app/utils/utils.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/data/helpers/end_points.dart';
import 'package:dhakaniya_gam/domain/entities/entities.dart';
import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http_parser/src/media_type.dart' as mediaType;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mime/mime.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  late Dio dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  /// Device info plugin initialization
  final deviceinfo = DeviceInfoPlugin();

  /// To get android device info
  AndroidDeviceInfo? androidDeviceInfo;

  /// To get iOS device info
  IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  // coverage:ignore-start
  /// initialize the andorid device information
  void _init() async {
    if (GetPlatform.isAndroid) {
      androidDeviceInfo = await deviceinfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceinfo.iosInfo;
    }
    dio = Dio();
  }

  // coverage:ignore-end

  /// Device id
  String? get deviceId => GetPlatform.isAndroid
      ? androidDeviceInfo?.id
      : iosDeviceInfo?.identifierForVendor;

  /// Device make brand
  String? get deviceMake =>
      GetPlatform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  /// Device Model
  String? get deviceModel =>
      GetPlatform.isAndroid ? androidDeviceInfo?.model : iosDeviceInfo?.model;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => GetPlatform.isAndroid ? '1' : '2';

  /// Device OS
  String get deviceOs => GetPlatform.isAndroid ? 'ANDROID' : 'IOS';

  /// API to get the IP of the user
  Future<String> getIp() async {
    var ip = '';
    if (await Utility.isNetworkAvailable()) {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          ip = addr.address;
        }
      }
      return ip.isNotEmpty ? ip : '0.0.0.0';
    }
    return '0.0.0.0';
  }

  /// Login API call
  Future<ResponseModel> loginApi({
    required String mobile,
    bool isLoading = false,
  }) async {
    var data = {
      'mobile': mobile,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.loginApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  /// verifyOtpApi API call
  Future<ResponseModel> verifyOtpApi({
    required String key,
    required String otp,
    required String mobile,
    required String fcm_token,
    bool isLoading = false,
  }) async {
    var data = {
      'mobile': mobile,
      'key': key,
      'otp': otp,
      'fcm_token': fcm_token,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.verifyOtpApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  // Send Message API call
  Future<ResponseModel> registerApi({
    required String profile_pic,
    required String villageId,
    required String surname,
    required String name,
    required String fathername,
    required String countryCode,
    required String mobile,
    required String email,
    required String current_address,
    required String businessCategoryId,
    required String other_business,
    required String village_representative,
    required String front_aadhara,
    required String back_aadhara,
    bool isLoading = false,
  }) async {
    var data = {
      'profile_pic': profile_pic,
      'surname': surname,
      'name': name,
      'fathername': fathername,
      'countryCode': countryCode,
      'mobile': mobile,
      'country_wise_contact': {
        "number": mobile.isEmpty ? "" : "0$mobile",
        "internationalNumber": "$countryCode$mobile",
        "nationalNumber": "0$mobile",
        "e164Number": countryCode + mobile,
        "countryCode": PhoneNumber.getISO2CodeByPrefix(countryCode),
        "dialCode": countryCode
      },
      'email': email,
      'current_address': current_address,
      'businessCategoryId': businessCategoryId,
      'other_business': other_business,
      'front_aadhara': front_aadhara,
      'back_aadhara': back_aadhara,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.registerApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  /// villagesApicall
  Future<ResponseModel> villagesApi({
    required String search,
    bool isLoading = false,
  }) async {
    var data = {
      'search': search,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.villagesApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  /// villagesApicall
  Future<ResponseModel> businessCategoriesApi({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.businessCategoriesApi,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  /// committeeMembersApi
  Future<ResponseModel> committeeMembersApi({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.committeeMembersApi,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  /// uploadProfilePic
  Future<ResponseModel> uploadProfilePic({
    bool isLoading = false,
    required String token,
    required bool isToken,
    List<ImageFormData>? mediaFileList,
  }) async {
    var data = {
      'token': token ?? "",
    };
    var response = await apiWrapper.makeRequest(
        EndPoints.uploadProfilePic,
        isToken ? Request.postWithFormData : Request.awsUpload,
        data,
        isLoading,
        isToken
            ? Utility.commonHeader()
            : Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
        mediaFileList: mediaFileList,
        fileKey: "profile_pic");
    return response;
  }

  Future<ResponseModel> uploadResiterProfilePic({
    bool isLoading = false,
    required String filePath,
  }) async {
    var response = await apiWrapper.makeRequest(
        EndPoints.uploadProfilePic,
        Request.awsUpload,
        filePath,
        isLoading,
        Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
        fileKey: "profile_pic");
    return response;
  }

  /// uploadProfilePic
  Future<ResponseModel> uploadAdharPic({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadAdharPic,
      Request.awsUploadAdhar,
      filePath,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  /// committeeMembersApi
  Future<ResponseModel> educationApi({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.educationApi,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  // Send Message API call
  Future<ResponseModel> setProfile({
    required String surname,
    required String name,
    required String fathername,
    required String optional_countryCode,
    required String optional_mobile,
    required String email,
    required String dob,
    required String blood_group,
    required String current_address,
    required String education,
    required String other_education,
    required String school_college_name,
    required String business,
    required String other_business,
    required String firm_name,
    required String business_address,
    required String business_details,
    required bool is_married,
    required String dom,
    required String house,
    required List<String> mediclaims,
    required String surnameLaw,
    required String nameLaw,
    required String fathernameLaw,
    required String village,
    required String taluka,
    required String district,
    bool isLoading = false,
  }) async {
    var data = {
      'surname': surname,
      'name': name,
      'fathername': fathername,
      'optional_countryCode': optional_countryCode,
      'optional_mobile': optional_mobile,
      'optional_country_wise_contact': optional_mobile.isNotEmpty
          ? {
              "number": optional_mobile.isEmpty ? "" : "0$optional_mobile",
              "internationalNumber": optional_mobile.isNotEmpty
                  ? "$optional_countryCode $optional_mobile"
                  : "",
              "nationalNumber": "0$optional_mobile",
              "e164Number": optional_countryCode + optional_mobile,
              "countryCode":
                  PhoneNumber.getISO2CodeByPrefix(optional_countryCode),
              "dialCode": optional_countryCode
            }
          : {},
      // 'email': email,
      'dob': dob,
      'blood_group': blood_group,
      'current_address': current_address,
      'education': education,
      'other_education': other_education,
      'school_college_name': school_college_name,
      'business': business,
      'other_business': other_business,
      'firm_name': firm_name,
      'business_address': business_address,
      'business_details': business_details,
      'dom': dom,
      // 'father_in_law': {
      //   "surname": surnameLaw,
      //   "name": nameLaw,
      //   "fathername": fathernameLaw,
      //   "village": village,
      //   "taluka": taluka,
      //   "district": district,
      // },
      'residential_type': house,
      'mediclaims': mediclaims,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.setProfile,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// committeeMembersApi
  Future<ResponseModel> getProfileApi({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.setProfile,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  // Send Message API call
  Future<ResponseModel> postFamilyMembersAdd({
    required String familyMemberId,
    required String surname,
    required String name,
    required String fathername,
    required String relation,
    required String countryCode,
    required String mobile,
    required String dob,
    required String blood_group,
    required String education,
    required String other_education,
    required String school_college_name,
    required String business,
    required String other_business,
    required String business_details,
    bool isLoading = false,
  }) async {
    var data = {
      'familyMemberId': familyMemberId,
      'surname': surname,
      'name': name,
      'fathername': fathername,
      'relation': relation,
      'countryCode': countryCode,
      'mobile': mobile,
      'country_wise_contact': {
        "number": mobile.isEmpty ? "" : "0$mobile",
        "internationalNumber": "$countryCode $mobile",
        "nationalNumber": "0$mobile",
        "e164Number": countryCode + mobile,
        "countryCode": PhoneNumber.getISO2CodeByPrefix(countryCode),
        "dialCode": countryCode
      },
      'dob': dob,
      'blood_group': blood_group,
      'education': education,
      'other_education': other_education,
      'school_college_name': school_college_name,
      'business': business,
      'other_business': other_business,
      'business_details': business_details,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postFamilyMembersAdd,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// get Family Members
  Future<ResponseModel> getFamilyMembers({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getFamilyMembers,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// getOneFamilyMembers
  Future<ResponseModel> getOneFamilyMembers({
    bool isLoading = false,
    required String familyMemberId,
  }) async {
    var data = {
      "familyMemberId": familyMemberId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.getOneFamilyMembers,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// postDeleteFamilyMembers
  Future<ResponseModel> postDeleteFamilyMembers({
    bool isLoading = false,
    required String familyMemberId,
  }) async {
    var data = {
      "familyMemberId": familyMemberId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postDeleteFamilyMembers,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// get Family Members
  Future<ResponseModel> getFullFamily({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getFullFamily,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// postForeignersSave
  Future<ResponseModel> postForeignersSave({
    bool isLoading = false,
    required String foreignerId,
    required String familyMemberId,
    required String countryCode,
    required String mobile,
    required String For,
    required String education,
    required String other_education,
    required String university_name,
    required String business,
    required String other_business,
    required String country,
    required String city,
    required int from,
  }) async {
    var data = {
      'foreignerId': foreignerId,
      'familyMemberId': familyMemberId,
      'countryCode': countryCode,
      'mobile': mobile,
      'country_wise_contact': {
        "number": mobile.isEmpty ? "" : "0$mobile",
        "internationalNumber": "$countryCode $mobile",
        "nationalNumber": "0$mobile",
        "e164Number": countryCode + mobile,
        "countryCode": PhoneNumber.getISO2CodeByPrefix(countryCode),
        "dialCode": countryCode
      },
      'For': For,
      'education': education,
      'other_education': other_education,
      'university_name': university_name,
      'business': business,
      'other_business': other_business,
      'country': country,
      'city': city,
      'from': from,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postForeignersSave,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// get Family Members
  Future<ResponseModel> getAllForeigners({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getAllForeigners,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// getOneForeigners
  Future<ResponseModel> getOneForeigners({
    bool isLoading = false,
    required String foreignerId,
  }) async {
    var data = {
      "foreignerId": foreignerId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.getOneForeigners,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// getOneForeigners
  Future<ResponseModel> postDeleteForeigner({
    bool isLoading = false,
    required String foreignerId,
  }) async {
    var data = {
      "foreignerId": foreignerId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postDeleteForeigner,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// getAllUsers
  Future<ResponseModel> getAllUsers({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String village,
    required String business,
    required String education,
    required String bloodGroup,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "search": search,
      "village": village,
      "business": business,
      "education": education,
      "blood_group": bloodGroup,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.getAllUsers,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// getAllUsers
  Future<ResponseModel> postSettingApi({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.postSettingApi,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// getAllUsers
  Future<ResponseModel> getOneUsers({
    required String userId,
    bool isLoading = false,
  }) async {
    var data = {
      "userId": userId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.getOneUsers,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// uploadProfilePic
  Future<ResponseModel> uploadResult({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadResult,
      Request.awsUploadResult,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  /// post Add Result
  Future<ResponseModel> postAddResult({
    required String familyMemberId,
    required String education,
    required String medium,
    required int totalMarks,
    required int obtainedMarks,
    required double percentage,
    required String result,
    bool isLoading = false,
  }) async {
    var data = {
      "familymember": familyMemberId,
      "education": education,
      "medium": medium,
      "total_marks": totalMarks,
      "obtained_marks": obtainedMarks,
      "percentage": percentage,
      "result": result,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postAddResult,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// post Add Result
  Future<ResponseModel> getAllResult({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getAllResult,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// post Add Result
  Future<ResponseModel> postCommitteemembers({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String designation,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "search": search,
      "designation": designation
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postCommitteemembers,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// post Add Result
  Future<ResponseModel> getScolarshipList({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getScolarshipList,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// post Add Result
  Future<ResponseModel> addScolarship({
    bool isLoading = false,
    required String familymember,
    required String education,
    required String school_college_name,
    required String document,
    required int fees,
    required String fee_receipt,
    required String remark,
    required String bank_name,
    required String branch_name,
    required int account_no,
    required String passbook,
    required String committeemember,
    required String village_representative,
  }) async {
    var data = {
      "familymember": familymember,
      "education": education,
      "school_college_name": school_college_name,
      "document": document,
      "fees": fees,
      "fee_receipt": fee_receipt,
      "remark": remark,
      "bank_name": bank_name,
      "branch_name": branch_name,
      "account_no": account_no,
      "passbook": passbook,
      "committeemember": committeemember,
      "village_representative": village_representative,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.addScolarship,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// uploadProfilePic
  Future<ResponseModel> uploadFeeReceipt({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadFeeReceipt,
      Request.awsUploadFee,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  /// uploadProfilePic
  Future<ResponseModel> uploadDocument({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadDocument,
      Request.awsFile,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  /// uploadProfilePic
  Future<ResponseModel> uploadPassbook({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadPassbook,
      Request.awsUploadPassbook,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  Future<ResponseModel> getStudies({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getStudies,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getWindowService({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getWindowService,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// uploadDeathCertificate
  Future<ResponseModel> uploadDeathCertificate({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadDeathCertificate,
      Request.awsFile,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  Future<ResponseModel> postWindowService({
    bool isLoading = false,
    required String familymember,
    required String profile_pic,
    required String dob,
    required String education,
    required String dod,
    required String death_certificate,
    required String countryCode,
    required String mobile,
    required String current_address,
    required String residential_type,
    required String current_situation,
    required String income_source,
    required List<ChildModel> childsList,
    required Pierre pierreList,
    required bool need_help,
  }) async {
    var data = {
      "familymember": familymember,
      "profile_pic": profile_pic,
      "dob": dob,
      "education": education,
      "dod": dod,
      "death_certificate": death_certificate,
      "countryCode": countryCode,
      "mobile": mobile,
      'country_wise_contact': {
        "number": mobile.isEmpty ? "" : "0$mobile",
        "internationalNumber": "$countryCode $mobile",
        "nationalNumber": "0$mobile",
        "e164Number": countryCode + mobile,
        "countryCode": PhoneNumber.getISO2CodeByPrefix(countryCode),
        "dialCode": countryCode
      },
      "current_address": current_address,
      "residential_type": residential_type,
      "current_situation": current_situation,
      "income_source": income_source,
      "childs": childsList,
      "pierre": pierreList,
      "need_help": need_help
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postWindowService,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// post Add Result
  Future<ResponseModel> getAllNotification({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
  }) async {
    var data = {
      "page": 1,
      "limit": 10,
      "search": search,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postNotification,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getAllLoan({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getAllLoan,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// post Add Result
  Future<ResponseModel> postLoanApply({
    bool isLoading = false,
    required String familymember,
    required String profile_pic,
    required String current_address,
    required String father_business,
    required String fatherBusinessAddress,
    required String rent_agreement,
    required String detailsStudy,
    required String detailStudyCollageName,
    required int passing_year,
    required String result,
    required String educational,
    required String educationalDegree,
    required int duration,
    required String educationalSchoolName,
    required String educationalSchoolAddress,
    required String educationalCategory,
    required int expenseFee,
    required String expenseFeeRecript,
    required int expenseHostelFee,
    required String expenseHostelFeeReceipt,
    required int otherExpenses,
    required int totalExpenses,
    required List<EarningMember> earningMemberList,
    required int areaOfLand,
  }) async {
    var data = {
      "familymember": familymember,
      "profile_pic": profile_pic,
      "current_address": current_address,
      "father_business": {
        "business": father_business,
        "business_address": fatherBusinessAddress
      },
      "rent_agreement": rent_agreement,
      "details_of_study": {
        "education": detailsStudy,
        "school_college_name": detailStudyCollageName,
        "passing_year": passing_year,
        "result": result
      },
      "details_of_study_for_educational_assistance": {
        "education": educational,
        "degree_name": educationalDegree,
        "duration": {
          "year": duration,
          "month": 0,
        },
        "school_college_name": educationalSchoolName,
        "school_college_address": educationalSchoolAddress,
        "category": educationalCategory
      },
      "expense_details": {
        "school_college_fees": expenseFee,
        "school_college_fees_receipt": expenseFeeRecript,
        "hostel_fees": expenseHostelFee,
        "hostel_fees_receipt": expenseHostelFeeReceipt,
        "other_expenses": otherExpenses,
        "total_expenses": totalExpenses
      },
      "earning_members": earningMemberList,
      "area_of_land": areaOfLand,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postLoanApply,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postDonatorsList({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.postDonatorsList,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postDonators({
    bool isLoading = false,
    required String fundId,
  }) async {
    var data = {
      'fundId': fundId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postDonators,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGallery({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    var data = {
      'page': page,
      'limit': limit,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postGallery,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postServiceActivities({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    var data = {
      'page': page,
      'limit': limit,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postServiceActivities,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetOneGallery({
    bool isLoading = false,
    required String galleryId,
  }) async {
    var data = {
      'galleryId': galleryId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postGetOneGallery,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetOneNotification({
    bool isLoading = false,
    required String messageId,
  }) async {
    var data = {
      'messageId': messageId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postGetOneNotification,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getAds({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getAds,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getAllVillage({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "search": search,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.getAllVillage,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postQualifiedPrizes({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String education,
    required String medium,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "search": search,
      "education": education,
      "medium": medium,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postQualifiedPrizes,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postQualifiedStationery({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String education,
    required String medium,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "education": education,
      "medium": medium,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postQualifiedStationery,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// post Add Result
  Future<ResponseModel> getCommitteemembers({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.postCommitteemembers,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  /// committeeMembersApi
  Future<ResponseModel> getCommitteeMembersApi({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.committeeMembersApi,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> uploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadProfile,
      Request.awsFile,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  Future<ResponseModel> uploadLoan({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');
    var response = await apiWrapper.makeRequest(
      EndPoints.uploadLoan,
      Request.awsFile,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  Future<ResponseModel> postDownloadStationery({
    bool isLoading = false,
    required String resultId,
  }) async {
    var data = {
      "resultId": resultId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postDownloadStationery,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postDownloadPrizeStationery({
    bool isLoading = false,
    required String resultId,
  }) async {
    var data = {
      "resultId": resultId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postDownloadPrizeStationery,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postStudiesList({
    bool isLoading = false,
    required String? search,
  }) async {
    var data = {
      "search": search,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postStudiesList,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }
}
