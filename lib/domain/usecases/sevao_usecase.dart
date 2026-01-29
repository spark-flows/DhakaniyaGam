import 'package:dhakaniya_gam/domain/domain.dart';

class SevaoUsecases {
  SevaoUsecases(this.repository);

  final Repository repository;

  Future<ScolarshipsListModel?> getScolarshipList({
    bool isLoading = false,
  }) async =>
      await repository.getScolarshipList(
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
      await repository.addScolarship(
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

  Future<String?> uploadDocument({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await repository.uploadDocument(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<String?> uploadPassbook({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await repository.uploadPassbook(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<AppliedWindowModel?> getWindowService({
    bool isLoading = false,
  }) async =>
      await repository.getWindowService(
        isLoading: isLoading,
      );

  Future<String?> uploadDeathCertificate({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await repository.uploadDeathCertificate(
        filePath: filePath,
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
      await repository.postWindowService(
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
      await repository.getAllLoan(
        isLoading: isLoading,
      );

  Future<String?> uploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.uploadProfile(
        isLoading: isLoading,
        filePath: filePath,
      );

  Future<String?> uploadLoan({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.uploadLoan(
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
      await repository.postLoanApply(
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

  Future<VillageRepresentativesModel?> getCommitteemembers({
    bool isLoading = false,
  }) async =>
      await repository.getCommitteemembers(
        isLoading: isLoading,
      );

  Future<VillageRepresentativesModel?> getCommitteeMembersApi({
    bool isLoading = false,
  }) async =>
      await repository.getCommitteeMembersApi(
        isLoading: isLoading,
      );
}
