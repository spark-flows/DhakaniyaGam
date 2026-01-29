import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:dhakaniya_gam/domain/usecases/usecases.dart';

class ParivarikVigatPresenter {
  ParivarikVigatPresenter(this.parivarikVigatUsecases, this.commonUsecases);

  final ParivarikVigatUsecases parivarikVigatUsecases;
  final CommonUsecases commonUsecases;

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

  Future<GetProfileModel?> getProfileApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getProfileApi(
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
  }) async =>
      await parivarikVigatUsecases.setProfile(
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

  Future<EducationListModel?> getStudies({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getStudies(
        isLoading: isLoading,
      );
}
