import 'dart:async';
import 'dart:convert';

import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/device/repositories/device_repositories.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:dhakaniya_gam/domain/models/get_one_notification_model.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  /// Clear data from local storage for [key].
  void clearData(dynamic key) {
    try {
      _deviceRepository.clearData(
        key,
      );
    } catch (_) {
      _dataRepository.clearData(
        key,
      );
    }
  }

  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key) {
    try {
      return _deviceRepository.getStringValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getStringValue(
        key,
      );
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value) {
    try {
      _deviceRepository.saveValue(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValue(
        key,
        value,
      );
    }
  }

  /// Get the bool value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the stored value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getStoredValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the secure value for the [key].
  /// [key] : The key whose value is needed.
  Future<String> getSecureValue(String key) async {
    try {
      return await _deviceRepository.getSecuredValue(key);
    } catch (_) {
      return await _dataRepository.getSecuredValue(key);
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveSecureValue(String key, String value) {
    try {
      _deviceRepository.saveValueSecurely(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValueSecurely(
        key,
        value,
      );
    }
  }

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key) {
    try {
      _deviceRepository.deleteSecuredValue(
        key,
      );
    } catch (_) {
      _dataRepository.deleteSecuredValue(
        key,
      );
    }
  }

  /// Clear all data from secure storage .
  void deleteAllSecuredValues() {
    try {
      _deviceRepository.deleteAllSecuredValues();
    } catch (_) {
      _dataRepository.deleteAllSecuredValues();
    }
  }

  /// API to login
  Future<LoginModel?> loginApi({
    required String mobile,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.loginApi(
        mobile: mobile,
        isLoading: isLoading,
      );
      var loginModel = loginModelFromJson(response.data);
      if (loginModel.status == 200) {
        return loginModel;
      } else {
        return loginModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  /// API to login
  Future<VerifyModel?> verifyOtpApi({
    required String key,
    required String otp,
    required String mobile,
    required String fcm_token,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.verifyOtpApi(
        mobile: mobile,
        key: key,
        otp: otp,
        fcm_token: fcm_token,
        isLoading: isLoading,
      );
      var verifyModel = verifyModelFromJson(response.data);
      if (verifyModel.status == 200) {
        saveValue(
            LocalKeys.authToken, verifyModel.data?.accessToken.toString());

        return verifyModel;
      } else {
        return verifyModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  /// API to Register
  Future<LoginModel?> registerApi({
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
    try {
      var response = await _dataRepository.registerApi(
        profile_pic: profile_pic,
        villageId: villageId,
        surname: surname,
        name: name,
        fathername: fathername,
        countryCode: countryCode,
        mobile: mobile,
        email: email,
        current_address: current_address,
        businessCategoryId: businessCategoryId,
        other_business: other_business,
        village_representative: village_representative,
        front_aadhara: front_aadhara,
        back_aadhara: back_aadhara,
      );
      var loginModel = loginModelFromJson(response.data);
      if (loginModel.status == 200) {
        return loginModel;
      } else {
        Utility.showMessage(
            loginModel.message.toString(), MessageType.error, () => null, '');
        return loginModel;
      }
    } catch (e) {
      print(e);
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<VillageListModel?> villagesApi({
    required String search,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.villagesApi(
        search: search,
        isLoading: isLoading,
      );
      var villageListModel = villageListModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<BusinessCategoriesModel?> businessCategoriesApi({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.businessCategoriesApi(
        isLoading: isLoading,
      );
      var villageListModel = businessCategoriesModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<CommitteeMembersModel?> committeeMembersApi({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.committeeMembersApi(
        isLoading: isLoading,
      );
      var villageListModel = committeeMembersModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadProfilePic({
    bool isLoading = false,
    required bool isToken,
    required String token,
    List<ImageFormData>? mediaFileList,
  }) async {
    try {
      var response = await _dataRepository.uploadProfilePic(
        isLoading: isLoading,
        isToken: isToken,
        token: token,
        mediaFileList: mediaFileList,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadAdharPic({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadAdharPic(
        isLoading: isLoading,
        filePath: filePath,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadResiterProfilePic({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadResiterProfilePic(
        isLoading: isLoading,
        filePath: filePath,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<BusinessCategoriesModel?> educationApi({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.educationApi(
        isLoading: isLoading,
      );
      var villageListModel = businessCategoriesModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetProfileModel?> getProfileApi({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getProfileApi(
        isLoading: isLoading,
      );
      var getProfileModel = getProfileModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> setProfile({
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
    try {
      var response = await _dataRepository.setProfile(
          surname: surname,
          name: name,
          fathername: fathername,
          optional_countryCode: optional_countryCode,
          optional_mobile: optional_mobile,
          email: email,
          dob: dob,
          blood_group: blood_group,
          current_address: current_address,
          education: education,
          other_education: other_education,
          school_college_name: school_college_name,
          business: business,
          other_business: other_business,
          firm_name: firm_name,
          business_address: business_address,
          business_details: business_details,
          is_married: is_married,
          dom: dom,
          house: house,
          mediclaims: mediclaims,
          surnameLaw: surnameLaw,
          nameLaw: nameLaw,
          fathernameLaw: fathernameLaw,
          village: village,
          taluka: taluka,
          district: district,
          isLoading: isLoading);
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postFamilyMembersAdd({
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
    try {
      var response = await _dataRepository.postFamilyMembersAdd(
        familyMemberId: familyMemberId,
        surname: surname,
        name: name,
        fathername: fathername,
        relation: relation,
        countryCode: countryCode,
        mobile: mobile,
        dob: dob,
        blood_group: blood_group,
        education: education,
        other_education: other_education,
        school_college_name: school_college_name,
        business: business,
        other_business: other_business,
        business_details: business_details,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<FamilyMembersModel?> getFamilyMembers({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getFamilyMembers(
        isLoading: isLoading,
      );
      var getProfileModel = familyMembersModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneFamilyMemberModel?> getOneFamilyMembers({
    required String familyMemberId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getOneFamilyMembers(
        familyMemberId: familyMemberId,
        isLoading: isLoading,
      );
      var getProfileModel = getOneFamilyMemberModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postDeleteFamilyMembers({
    required String familyMemberId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postDeleteFamilyMembers(
        familyMemberId: familyMemberId,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetFamilyModel?> getFullFamily({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getFullFamily(
        isLoading: isLoading,
      );
      var getProfileModel = getFamilyModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postForeignersSave({
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
    try {
      var response = await _dataRepository.postForeignersSave(
        foreignerId: foreignerId,
        familyMemberId: familyMemberId,
        countryCode: countryCode,
        mobile: mobile,
        For: For,
        education: education,
        other_education: other_education,
        university_name: university_name,
        business: business,
        other_business: other_business,
        country: country,
        city: city,
        from: from,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ForeignersMemberModel?> getAllForeigners({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getAllForeigners(
        isLoading: isLoading,
      );
      var getProfileModel = foreignersMemberModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneForeignersMemberModel?> getOneForeigners({
    required String foreignerId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getOneForeigners(
        foreignerId: foreignerId,
        isLoading: isLoading,
      );
      var getProfileModel = getOneForeignersMemberModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return getProfileModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postDeleteForeigner({
    required String foreignerId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postDeleteForeigner(
        foreignerId: foreignerId,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetAllUsersModel?> getAllUsers({
    required int page,
    required int limit,
    required String search,
    required String village,
    required String business,
    required String education,
    required String bloodGroup,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getAllUsers(
        page: page,
        limit: limit,
        search: search,
        village: village,
        business: business,
        education: education,
        bloodGroup: bloodGroup,
        isLoading: isLoading,
      );
      var getProfileModel = getAllUsersModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<SettingModel?> postSettingApi({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postSettingApi(
        isLoading: isLoading,
      );
      var getProfileModel = settingModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneUserDetailsModel?> getOneUsers({
    required String userId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getOneUsers(
        userId: userId,
        isLoading: isLoading,
      );
      var getProfileModel = getOneUserDetailsModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadResult({
    required String filePath,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.uploadResult(
        filePath: filePath,
        isLoading: isLoading,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResultModel?> postAddResult({
    required String familyMemberId,
    required String education,
    required String medium,
    required int totalMarks,
    required int obtainedMarks,
    required double percentage,
    required String result,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postAddResult(
        familyMemberId: familyMemberId,
        education: education,
        medium: medium,
        totalMarks: totalMarks,
        obtainedMarks: obtainedMarks,
        percentage: percentage,
        result: result,
        isLoading: isLoading,
      );
      var getProfileModel = resultModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return getProfileModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetResultModel?> getAllResult({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getAllResult(
        isLoading: isLoading,
      );
      var getProfileModel = getResultModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<CommitteeMemberModel?> postCommitteemembers({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String designation,
  }) async {
    try {
      var response = await _dataRepository.postCommitteemembers(
        page: page,
        limit: limit,
        search: search,
        designation: designation,
        isLoading: isLoading,
      );
      var getProfileModel = committeeMemberModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ScolarshipsListModel?> getScolarshipList({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getScolarshipList(
        isLoading: isLoading,
      );
      var getProfileModel = scolarshipsListModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> addScolarship({
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
    try {
      var response = await _dataRepository.addScolarship(
        familymember: familymember,
        education: education,
        school_college_name: school_college_name,
        document: document,
        fees: fees,
        fee_receipt: fee_receipt,
        remark: remark,
        bank_name: bank_name,
        branch_name: branch_name,
        account_no: account_no,
        passbook: passbook,
        committeemember: committeemember,
        village_representative: village_representative,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadFeeReceipt({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadFeeReceipt(
        isLoading: isLoading,
        filePath: filePath,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadDocument({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadDocument(
        isLoading: isLoading,
        filePath: filePath,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadPassbook({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadPassbook(
        isLoading: isLoading,
        filePath: filePath,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<EducationListModel?> getStudies({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getStudies(
        isLoading: isLoading,
      );
      var getProfileModel = educationListModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<AppliedWindowModel?> getWindowService({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getWindowService(
        isLoading: isLoading,
      );
      var getProfileModel = appliedWindowModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadDeathCertificate({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadDeathCertificate(
        isLoading: isLoading,
        filePath: filePath,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postWindowService({
    bool isLoading = false,
    required String profile_pic,
    required String familymember,
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
    try {
      var response = await _dataRepository.postWindowService(
        profile_pic: profile_pic,
        familymember: familymember,
        dob: dob,
        education: education,
        dod: dod,
        death_certificate: death_certificate,
        countryCode: countryCode,
        mobile: mobile,
        current_address: current_address,
        residential_type: residential_type,
        current_situation: current_situation,
        income_source: income_source,
        childsList: childsList,
        pierreList: pierreList,
        need_help: need_help,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetAllMessageModel?> getAllNotification({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
  }) async {
    try {
      var response = await _dataRepository.getAllNotification(
        isLoading: isLoading,
        page: page,
        limit: limit,
        search: search,
      );
      var getProfileModel = getAllMessageModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return getProfileModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<LoanModel?> getAllLoan({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getAllLoan(
        isLoading: isLoading,
      );
      var getProfileModel = loanModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postLoanApply({
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
    try {
      var response = await _dataRepository.postLoanApply(
        isLoading: isLoading,
        familymember: familymember,
        profile_pic: profile_pic,
        current_address: current_address,
        father_business: father_business,
        fatherBusinessAddress: fatherBusinessAddress,
        rent_agreement: rent_agreement,
        detailsStudy: detailsStudy,
        detailStudyCollageName: detailStudyCollageName,
        passing_year: passing_year,
        result: result,
        educational: educational,
        educationalDegree: educationalDegree,
        duration: duration,
        educationalSchoolName: educationalSchoolName,
        educationalSchoolAddress: educationalSchoolAddress,
        educationalCategory: educationalCategory,
        expenseFee: expenseFee,
        expenseFeeRecript: expenseFeeRecript,
        expenseHostelFee: expenseHostelFee,
        expenseHostelFeeReceipt: expenseHostelFeeReceipt,
        otherExpenses: otherExpenses,
        totalExpenses: totalExpenses,
        earningMemberList: earningMemberList,
        areaOfLand: areaOfLand,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<DonarListModel?> postDonatorsList({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postDonatorsList(
        isLoading: isLoading,
      );
      var getProfileModel = donarListModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneDonarModel?> postDonators({
    required String fundId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postDonators(
        fundId: fundId,
        isLoading: isLoading,
      );
      var getProfileModel = getOneDonarModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GalleryModel?> postGallery({
    required int page,
    required int limit,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postGallery(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );
      var getProfileModel = galleryModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ServiceModel?> postServiceActivities({
    required int page,
    required int limit,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postServiceActivities(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );
      var getProfileModel = serviceModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneGalleryModel?> postGetOneGallery({
    required String galleryId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postGetOneGallery(
        galleryId: galleryId,
        isLoading: isLoading,
      );
      var getProfileModel = getOneGalleryModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneNotificationModel?> postGetOneNotification({
    required String messageId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postGetOneNotification(
        messageId: messageId,
        isLoading: isLoading,
      );
      var getProfileModel = getOneNotificationModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<AdsListModel?> getAds({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getAds(
        isLoading: isLoading,
      );
      var getProfileModel = adsListModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<VillageListDataModel?> getAllVillage({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
  }) async {
    try {
      var response = await _dataRepository.getAllVillage(
        isLoading: isLoading,
        page: page,
        limit: limit,
        search: search,
      );
      var getProfileModel = villageListDataModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<QualifiedPrizeModel?> postQualifiedStationery({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String education,
    required String medium,
  }) async {
    try {
      var response = await _dataRepository.postQualifiedStationery(
        isLoading: isLoading,
        page: page,
        limit: limit,
        search: search,
        education: education,
        medium: medium,
      );
      var getProfileModel = qualifiedPrizeModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<QualifiedPrizeModel?> postQualifiedPrizes({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String education,
    required String medium,
  }) async {
    try {
      var response = await _dataRepository.postQualifiedPrizes(
        isLoading: isLoading,
        page: page,
        limit: limit,
        search: search,
        education: education,
        medium: medium,
      );
      var getProfileModel = qualifiedPrizeModelFromJson(response.data);
      if (getProfileModel.status == 200) {
        return getProfileModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<VillageRepresentativesModel?> getCommitteemembers({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getCommitteemembers(
        isLoading: isLoading,
      );
      var villageListModel = villageRepresentativesModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<VillageRepresentativesModel?> getCommitteeMembersApi({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getCommitteeMembersApi(
        isLoading: isLoading,
      );
      var villageListModel = villageRepresentativesModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadProfile(
        isLoading: isLoading,
        filePath: filePath,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<String?> uploadLoan({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadLoan(
        isLoading: isLoading,
        filePath: filePath,
      );
      if (response.statusCode == 200) {
        return json.decode(response.data)['Data']['path'];
      } else {
        Utility.showMessage(json.decode(response.data)['Message'].toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<StationeryCouponModel?> postDownloadStationery({
    required String resultId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postDownloadStationery(
        isLoading: isLoading,
        resultId: resultId,
      );
      var villageListModel = stationeryCouponModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<PriceCouponModel?> postDownloadPrize({
    required String resultId,
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.postDownloadPrize(
        isLoading: isLoading,
        resultId: resultId,
      );
      var villageListModel = priceCouponModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<EducationModel?> postStudiesList({
    bool isLoading = false,
    required String? search,
  }) async {
    try {
      var response = await _dataRepository.postStudiesList(
        isLoading: isLoading,
        search: search,
      );
      var villageListModel = educationModelFromJson(response.data);
      if (villageListModel.status == 200) {
        return villageListModel;
      } else {
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }
}
