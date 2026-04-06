import 'package:dhakaniya_gam/domain/domain.dart';

class DashboardPresenter {
  DashboardPresenter(this.dashboardUsecases, this.commonUsecases);

  final DashboardUsecases dashboardUsecases;
  final CommonUsecases commonUsecases;

  Future<GetAllUsersModel?> getAllUsers({
    required int page,
    required int limit,
    required String search,
    required String village,
    required String business,
    required String education,
    required String bloodGroup,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.getAllUsers(
        page: page,
        limit: limit,
        search: search,
        village: village,
        business: business,
        education: education,
        bloodGroup: bloodGroup,
        isLoading: isLoading,
      );

  Future<GetOneUserDetailsModel?> getOneUsers({
    required String userId,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.getOneUsers(
        userId: userId,
        isLoading: isLoading,
      );

  Future<String?> uploadResult({
    required String filePath,
    bool isLoading = false,
  }) async =>
      await commonUsecases.uploadResult(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResultModel?> postAddResult({
    required String familyMemberId,
    required String education,
    required String medium,
    required int totalMarks,
    required int obtainedMarks,
    required double percentage,
    required String result,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postAddResult(
        familyMemberId: familyMemberId,
        education: education,
        medium: medium,
        totalMarks: totalMarks,
        obtainedMarks: obtainedMarks,
        percentage: percentage,
        result: result,
        isLoading: isLoading,
      );

  Future<GetResultModel?> getAllResult({
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.getAllResult(
        isLoading: isLoading,
      );

  Future<GetFamilyModel?> getFullFamily({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getFullFamily(
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> educationApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.educationApi(
        isLoading: isLoading,
      );

  Future<CommitteeMemberModel?> postCommitteemembers({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String designation,
  }) async =>
      await dashboardUsecases.postCommitteemembers(
        page: page,
        limit: limit,
        search: search,
        designation: designation,
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

  Future<EducationListModel?> getStudies({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getStudies(
        isLoading: isLoading,
      );

  Future<DonarListModel?> postDonatorsList({
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postDonatorsList(
        isLoading: isLoading,
      );

  Future<GetOneDonarModel?> postDonators({
    required String fundId,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postDonators(
        fundId: fundId,
        isLoading: isLoading,
      );

  Future<GalleryModel?> postGallery({
    required int page,
    required int limit,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postGallery(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<ServiceModel?> postServiceActivities({
    required int page,
    required int limit,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postServiceActivities(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneGalleryModel?> postGetOneGallery({
    required String galleryId,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postGetOneGallery(
        galleryId: galleryId,
        isLoading: isLoading,
      );

  Future<AdsListModel?> getAds({
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.getAds(
        isLoading: isLoading,
      );

  Future<VillageListDataModel?> getAllVillage({
    required int page,
    required int limit,
    required String search,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.getAllVillage(
        page: page,
        limit: limit,
        search: search,
        isLoading: isLoading,
      );

  Future<QualifiedPrizeModel?> postQualifiedPrizes({
    required int page,
    required int limit,
    required String search,
    required String education,
    required String medium,
    required int year,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postQualifiedPrizes(
        page: page,
        limit: limit,
        search: search,
        education: education,
        medium: medium,
        year: year,
        isLoading: isLoading,
      );

  Future<QualifiedPrizeModel?> postQualifiedStationery({
    required int page,
    required int limit,
    required String search,
    required String education,
    required String medium,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postQualifiedStationery(
        page: page,
        limit: limit,
        search: search,
        education: education,
        medium: medium,
        isLoading: isLoading,
      );

  Future<StationeryCouponModel?> postDownloadStationery({
    required String resultId,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postDownloadStationery(
        resultId: resultId,
        isLoading: isLoading,
      );

  Future<PriceCouponModel?> postDownloadPrize({
    required String resultId,
    bool isLoading = false,
  }) async =>
      await dashboardUsecases.postDownloadPrize(
        resultId: resultId,
        isLoading: isLoading,
      );

  Future<EducationModel?> postStudiesList({
    bool isLoading = false,
    required String? search,
  }) async =>
      await dashboardUsecases.postStudiesList(
        isLoading: isLoading,
        search: search,
      );
}
