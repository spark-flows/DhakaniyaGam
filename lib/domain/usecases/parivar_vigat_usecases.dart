import 'package:dhakaniya_gam/domain/domain.dart';

class ParivarikVigatUsecases {
  ParivarikVigatUsecases(this.repository);

  final Repository repository;


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
      await repository.setProfile(
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
}
