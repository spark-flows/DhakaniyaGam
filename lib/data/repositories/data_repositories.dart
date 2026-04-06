import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  /// Delete the box
  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  /// return bool value
  @override
  bool getBoolValue(String key) => throw UnimplementedError();

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    throw UnimplementedError();
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    throw UnimplementedError();
  }

  /// API to get the IP of the user
  @override
  Future<String> getIp() async => await connectHelper.getIp();

  Future<ResponseModel> loginApi({
    required String mobile,
    bool isLoading = false,
  }) async =>
      connectHelper.loginApi(
        mobile: mobile,
        isLoading: isLoading,
      );

  Future<ResponseModel> verifyOtpApi({
    required String key,
    required String otp,
    required String mobile,
    required String fcm_token,
    bool isLoading = false,
  }) async =>
      connectHelper.verifyOtpApi(
        mobile: mobile,
        key: key,
        otp: otp,
        fcm_token: fcm_token,
        isLoading: isLoading,
      );

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
  }) async =>
      connectHelper.registerApi(
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
        isLoading: isLoading,
      );

  Future<ResponseModel> villagesApi({
    required String search,
    bool isLoading = false,
  }) async =>
      connectHelper.villagesApi(
        search: search,
        isLoading: isLoading,
      );

  Future<ResponseModel> businessCategoriesApi({
    bool isLoading = false,
  }) async =>
      connectHelper.businessCategoriesApi(
        isLoading: isLoading,
      );

  Future<ResponseModel> committeeMembersApi({
    bool isLoading = false,
  }) async =>
      connectHelper.committeeMembersApi(
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadProfilePic({
    required bool isToken,
    required String token,
    List<ImageFormData>? mediaFileList,
    bool isLoading = false,
  }) async =>
      connectHelper.uploadProfilePic(
        isToken: isToken,
        token: token,
        mediaFileList: mediaFileList,
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadResiterProfilePic({
    required String filePath,
    bool isLoading = false,
  }) async =>
      connectHelper.uploadResiterProfilePic(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadAdharPic({
    required String filePath,
    bool isLoading = false,
  }) async =>
      connectHelper.uploadAdharPic(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> educationApi({
    bool isLoading = false,
  }) async =>
      connectHelper.educationApi(
        isLoading: isLoading,
      );

  Future<ResponseModel> getProfileApi({
    bool isLoading = false,
  }) async =>
      connectHelper.getProfileApi(
        isLoading: isLoading,
      );

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
  }) async =>
      connectHelper.setProfile(
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
        isLoading: isLoading,
      );

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
  }) async =>
      connectHelper.postFamilyMembersAdd(
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

  Future<ResponseModel> getFamilyMembers({
    bool isLoading = false,
  }) async =>
      connectHelper.getFamilyMembers(
        isLoading: isLoading,
      );

  Future<ResponseModel> getOneFamilyMembers({
    required String familyMemberId,
    bool isLoading = false,
  }) async =>
      connectHelper.getOneFamilyMembers(
        isLoading: isLoading,
        familyMemberId: familyMemberId,
      );

  Future<ResponseModel> postDeleteFamilyMembers({
    required String familyMemberId,
    bool isLoading = false,
  }) async =>
      connectHelper.postDeleteFamilyMembers(
        familyMemberId: familyMemberId,
        isLoading: isLoading,
      );

  Future<ResponseModel> getFullFamily({
    bool isLoading = false,
  }) async =>
      connectHelper.getFullFamily(
        isLoading: isLoading,
      );

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
  }) async =>
      connectHelper.postForeignersSave(
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
        isLoading: isLoading,
      );

  Future<ResponseModel> getAllForeigners({
    bool isLoading = false,
  }) async =>
      connectHelper.getAllForeigners(
        isLoading: isLoading,
      );

  Future<ResponseModel> getOneForeigners({
    required String foreignerId,
    bool isLoading = false,
  }) async =>
      connectHelper.getOneForeigners(
        isLoading: isLoading,
        foreignerId: foreignerId,
      );

  Future<ResponseModel> postDeleteForeigner({
    required String foreignerId,
    bool isLoading = false,
  }) async =>
      connectHelper.postDeleteForeigner(
        foreignerId: foreignerId,
        isLoading: isLoading,
      );

  Future<ResponseModel> getAllUsers({
    required int page,
    required int limit,
    required String search,
    required String village,
    required String business,
    required String education,
    required String bloodGroup,
    bool isLoading = false,
  }) async =>
      connectHelper.getAllUsers(
        page: page,
        limit: limit,
        search: search,
        village: village,
        business: business,
        education: education,
        bloodGroup: bloodGroup,
        isLoading: isLoading,
      );

  Future<ResponseModel> postSettingApi({
    bool isLoading = false,
  }) async =>
      connectHelper.postSettingApi(
        isLoading: isLoading,
      );

  Future<ResponseModel> getOneUsers({
    required String userId,
    bool isLoading = false,
  }) async =>
      connectHelper.getOneUsers(
        userId: userId,
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadResult({
    required String filePath,
    bool isLoading = false,
  }) async =>
      connectHelper.uploadResult(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> postAddResult({
    required String familyMemberId,
    required String education,
    required String medium,
    required int totalMarks,
    required int obtainedMarks,
    required double percentage,
    required String result,
    bool isLoading = false,
  }) async =>
      connectHelper.postAddResult(
        familyMemberId: familyMemberId,
        education: education,
        medium: medium,
        totalMarks: totalMarks,
        obtainedMarks: obtainedMarks,
        percentage: percentage,
        result: result,
        isLoading: isLoading,
      );

  Future<ResponseModel> getAllResult({
    bool isLoading = false,
  }) async =>
      connectHelper.getAllResult(
        isLoading: isLoading,
      );

  Future<ResponseModel> postCommitteemembers({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String designation,
  }) async =>
      connectHelper.postCommitteemembers(
        page: page,
        limit: limit,
        search: search,
        designation: designation,
        isLoading: isLoading,
      );

  Future<ResponseModel> getScolarshipList({
    bool isLoading = false,
  }) async =>
      connectHelper.getScolarshipList(
        isLoading: isLoading,
      );

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
  }) async =>
      connectHelper.addScolarship(
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

  Future<ResponseModel> uploadFeeReceipt({
    required String filePath,
    bool isLoading = false,
  }) async =>
      connectHelper.uploadFeeReceipt(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadDocument({
    required String filePath,
    bool isLoading = false,
  }) async =>
      connectHelper.uploadDocument(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadPassbook({
    required String filePath,
    bool isLoading = false,
  }) async =>
      connectHelper.uploadPassbook(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> getStudies({
    bool isLoading = false,
  }) async =>
      connectHelper.getStudies(
        isLoading: isLoading,
      );

  Future<ResponseModel> getWindowService({
    bool isLoading = false,
  }) async =>
      connectHelper.getWindowService(
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadDeathCertificate({
    required String filePath,
    bool isLoading = false,
  }) async =>
      connectHelper.uploadDeathCertificate(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> postWindowService({
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
  }) async =>
      connectHelper.postWindowService(
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

  Future<ResponseModel> getAllNotification({
    required int page,
    required int limit,
    required String search,
    bool isLoading = false,
  }) async =>
      connectHelper.getAllNotification(
        page: page,
        limit: limit,
        search: search,
        isLoading: isLoading,
      );

  Future<ResponseModel> getAllLoan({
    bool isLoading = false,
  }) async =>
      connectHelper.getAllLoan(
        isLoading: isLoading,
      );

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
  }) async =>
      connectHelper.postLoanApply(
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

  Future<ResponseModel> postDonatorsList({
    bool isLoading = false,
  }) async =>
      connectHelper.postDonatorsList(
        isLoading: isLoading,
      );

  Future<ResponseModel> postDonators({
    required String fundId,
    bool isLoading = false,
  }) async =>
      connectHelper.postDonators(
        fundId: fundId,
        isLoading: isLoading,
      );

  Future<ResponseModel> postGallery({
    required int page,
    required int limit,
    bool isLoading = false,
  }) async =>
      connectHelper.postGallery(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<ResponseModel> postServiceActivities({
    required int page,
    required int limit,
    bool isLoading = false,
  }) async =>
      connectHelper.postServiceActivities(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<ResponseModel> postGetOneGallery({
    required String galleryId,
    bool isLoading = false,
  }) async =>
      connectHelper.postGetOneGallery(
        galleryId: galleryId,
        isLoading: isLoading,
      );

  Future<ResponseModel> postGetOneNotification({
    required String messageId,
    bool isLoading = false,
  }) async =>
      connectHelper.postGetOneNotification(
        messageId: messageId,
        isLoading: isLoading,
      );

  Future<ResponseModel> getAds({
    bool isLoading = false,
  }) async =>
      connectHelper.getAds(
        isLoading: isLoading,
      );

  Future<ResponseModel> getAllVillage({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
  }) async =>
      connectHelper.getAllVillage(
        page: page,
        limit: limit,
        search: search,
        isLoading: isLoading,
      );

  Future<ResponseModel> postQualifiedPrizes({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String education,
    required String medium,
    required int year,
  }) async =>
      connectHelper.postQualifiedPrizes(
        page: page,
        limit: limit,
        search: search,
        education: education,
        medium: medium,
        year: year
      );

  Future<ResponseModel> postQualifiedStationery({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String education,
    required String medium,
  }) async =>
      connectHelper.postQualifiedStationery(
        page: page,
        limit: limit,
        search: search,
        education: education,
        medium: medium,
      );

  Future<ResponseModel> getCommitteemembers({
    bool isLoading = false,
  }) async =>
      connectHelper.getCommitteemembers(
        isLoading: isLoading,
      );

  Future<ResponseModel> getCommitteeMembersApi({
    bool isLoading = false,
  }) async =>
      connectHelper.getCommitteeMembersApi(
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async =>
      connectHelper.uploadProfile(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> uploadLoan({
    bool isLoading = false,
    required String filePath,
  }) async =>
      connectHelper.uploadLoan(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> postDownloadStationery({
    bool isLoading = false,
    required String resultId,
  }) async =>
      connectHelper.postDownloadStationery(
        resultId: resultId,
        isLoading: isLoading,
      );

  Future<ResponseModel> postDownloadPrize({
    bool isLoading = false,
    required String resultId,
  }) async =>
      connectHelper.postDownloadPrizeStationery(
        resultId: resultId,
        isLoading: isLoading,
      );

  Future<ResponseModel> postStudiesList({
    bool isLoading = false,
    required String? search,
  }) async =>
      connectHelper.postStudiesList(
        search: search,
        isLoading: isLoading,
      );
}
