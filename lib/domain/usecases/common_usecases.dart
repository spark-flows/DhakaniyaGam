import 'package:dhakaniya_gam/domain/domain.dart';

class CommonUsecases {
  CommonUsecases(this.repository);

  final Repository repository;

  Future<GetProfileModel?> getProfileApi({
    bool isLoading = false,
  }) async =>
      await repository.getProfileApi(
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> businessCategoriesApi({
    bool isLoading = false,
  }) async =>
      await repository.businessCategoriesApi(
        isLoading: isLoading,
      );

  Future<VillageListModel?> villagesApi({
    required String search,
    bool isLoading = false,
  }) async =>
      await repository.villagesApi(
        search: search,
        isLoading: isLoading,
      );

  Future<String?> uploadProfilePic({
    bool isLoading = false,
    required bool isToken,
    required String token,
    List<ImageFormData>? mediaFileList,
  }) async =>
      await repository.uploadProfilePic(
        isToken: isToken,
        token: token,
        mediaFileList: mediaFileList,
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> educationApi({
    bool isLoading = false,
  }) async =>
      await repository.educationApi(
        isLoading: isLoading,
      );

  Future<GetFamilyModel?> getFullFamily({
    bool isLoading = false,
  }) async =>
      await repository.getFullFamily(
        isLoading: isLoading,
      );

  Future<SettingModel?> postSettingApi({
    bool isLoading = false,
  }) async =>
      await repository.postSettingApi(
        isLoading: isLoading,
      );

  Future<CommitteeMembersModel?> committeeMembersApi({
    bool isLoading = false,
  }) async =>
      await repository.committeeMembersApi(
        isLoading: isLoading,
      );

  Future<String?> uploadFeeReceipt({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await repository.uploadFeeReceipt(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<GetOneFamilyMemberModel?> getOneFamilyMembers({
    required String familyMemberId,
    bool isLoading = false,
  }) async =>
      await repository.getOneFamilyMembers(
        familyMemberId: familyMemberId,
        isLoading: isLoading,
      );

  Future<String?> uploadResult({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await repository.uploadResult(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<EducationListModel?> getStudies({
    bool isLoading = false,
  }) async =>
      await repository.getStudies(
        isLoading: isLoading,
      );
}
