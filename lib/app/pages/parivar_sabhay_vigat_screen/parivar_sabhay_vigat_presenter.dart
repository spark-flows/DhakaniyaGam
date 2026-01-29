import 'package:dhakaniya_gam/domain/domain.dart';

class ParivarSabhayVigatPresenter {
  ParivarSabhayVigatPresenter(
      this.parivarSabhayVigatUsecases, this.commonUsecases);

  final ParivarSabhayVigatUsecases parivarSabhayVigatUsecases;
  final CommonUsecases commonUsecases;

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
  }) async =>
      await parivarSabhayVigatUsecases.postFamilyMembersAdd(
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
        isLoading: isLoading,
      );

  Future<FamilyMembersModel?> getFamilyMembers({
    bool isLoading = false,
  }) async =>
      await parivarSabhayVigatUsecases.getFamilyMembers(
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

  Future<ResponseModel?> postDeleteFamilyMembers({
    required String familyMemberId,
    bool isLoading = false,
  }) async =>
      await parivarSabhayVigatUsecases.postDeleteFamilyMembers(
        familyMemberId: familyMemberId,
        isLoading: isLoading,
      );

  Future<GetFamilyModel?> getFullFamily({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getFullFamily(
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> businessCategoriesApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.businessCategoriesApi(
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> educationApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.educationApi(
        isLoading: isLoading,
      );
}
