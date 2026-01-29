import 'package:dhakaniya_gam/domain/domain.dart';

class RegisterPresenter {
  RegisterPresenter(this.registerUsecases, this.commonUsecases);

  final RegisterUsecases registerUsecases;
  final CommonUsecases commonUsecases;

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
      await registerUsecases.registerApi(
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

  Future<VillageListModel?> villagesApi({
    required String search,
    bool isLoading = false,
  }) async =>
      await commonUsecases.villagesApi(
        search: search,
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> businessCategoriesApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.businessCategoriesApi(
        isLoading: isLoading,
      );

  Future<CommitteeMembersModel?> committeeMembersApi({
    bool isLoading = false,
  }) async =>
      await registerUsecases.committeeMembersApi(
        isLoading: isLoading,
      );

  Future<String?> uploadProfilePic({
    required bool isToken,
    bool isLoading = false,
    required String token,
    List<ImageFormData>? mediaFileList,
  }) async =>
      await commonUsecases.uploadProfilePic(
        isToken: isToken,
        token: token,
        mediaFileList: mediaFileList,
        isLoading: isLoading,
      );

  Future<String?> uploadAdharPic({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await registerUsecases.uploadAdharPic(
        filePath: filePath,
        isLoading: isLoading,
      );
}
