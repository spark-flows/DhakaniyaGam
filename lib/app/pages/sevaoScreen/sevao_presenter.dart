import 'package:dhakaniya_gam/domain/domain.dart';

class SevaoPresenter {
  SevaoPresenter(this.sevaoUsecases, this.commonUsecases);

  final SevaoUsecases sevaoUsecases;
  final CommonUsecases commonUsecases;

  Future<GetFamilyModel?> getFullFamily({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getFullFamily(
        isLoading: isLoading,
      );

  Future<ScolarshipsListModel?> getScolarshipList({
    bool isLoading = false,
  }) async =>
      await sevaoUsecases.getScolarshipList(
        isLoading: isLoading,
      );

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
  }) async =>
      await sevaoUsecases.addScolarship(
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

  Future<String?> uploadFeeReceipt({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await commonUsecases.uploadFeeReceipt(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<String?> uploadDocument({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await sevaoUsecases.uploadDocument(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<String?> uploadPassbook({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await sevaoUsecases.uploadPassbook(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<CommitteeMembersModel?> committeeMembersApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.committeeMembersApi(
        isLoading: isLoading,
      );

  Future<EducationListModel?> getStudies({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getStudies(
        isLoading: isLoading,
      );

  Future<AppliedWindowModel?> getWindowService({
    bool isLoading = false,
  }) async =>
      await sevaoUsecases.getWindowService(
        isLoading: isLoading,
      );

  Future<String?> uploadDeathCertificate({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await sevaoUsecases.uploadDeathCertificate(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<String?> uploadProfilePic({
    bool isLoading = false,
    required bool isToken,
    required String token,
    List<ImageFormData>? mediaFileList,
  }) async =>
      await commonUsecases.uploadProfilePic(
        isToken: isToken,
        token: token,
        mediaFileList: mediaFileList,
        isLoading: isLoading,
      );

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
  }) async =>
      await sevaoUsecases.postWindowService(
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

  Future<LoanModel?> getAllLoan({
    bool isLoading = false,
  }) async =>
      await sevaoUsecases.getAllLoan(
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> businessCategoriesApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.businessCategoriesApi(
        isLoading: isLoading,
      );

  Future<String?> uploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await sevaoUsecases.uploadProfile(
        isLoading: isLoading,
        filePath: filePath,
      );

  Future<String?> uploadLoan({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await sevaoUsecases.uploadLoan(
        isLoading: isLoading,
        filePath: filePath,
      );

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
  }) async =>
      await sevaoUsecases.postLoanApply(
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

  Future<String?> uploadResult({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await commonUsecases.uploadResult(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<GetOneFamilyMemberModel?> getOneFamilyMembers({
    required String familyMemberId,
    bool isLoading = false,
  }) async =>
      await commonUsecases.getOneFamilyMembers(
        familyMemberId: familyMemberId,
        isLoading: isLoading,
      );

  Future<VillageRepresentativesModel?> getCommitteemembers({
    bool isLoading = false,
  }) async =>
      await sevaoUsecases.getCommitteemembers(
        isLoading: isLoading,
      );

  Future<VillageRepresentativesModel?> getCommitteeMembersApi({
    bool isLoading = false,
  }) async =>
      await sevaoUsecases.getCommitteeMembersApi(
        isLoading: isLoading,
      );
}
