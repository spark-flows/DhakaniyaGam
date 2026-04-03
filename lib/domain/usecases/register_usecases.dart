import 'package:dhakaniya_gam/domain/domain.dart';

class RegisterUsecases {
  RegisterUsecases(this.repository);

  final Repository repository;

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
  }) async =>
      await repository.registerApi(
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

  Future<CommitteeMembersModel?> committeeMembersApi({
    bool isLoading = false,
  }) async =>
      await repository.committeeMembersApi(
        isLoading: isLoading,
      );

  Future<String?> uploadAdharPic({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await repository.uploadAdharPic(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<String?> uploadResiterProfilePic({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.uploadResiterProfilePic(
        isLoading: isLoading,
        filePath: filePath,
      );
}
