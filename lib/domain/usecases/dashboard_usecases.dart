import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:dhakaniya_gam/domain/models/get_one_notification_model.dart';

class DashboardUsecases {
  DashboardUsecases(this.repository);

  final Repository repository;

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
      await repository.getAllUsers(
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
      await repository.getOneUsers(
        userId: userId,
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
      await repository.postAddResult(
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
      await repository.getAllResult(
        isLoading: isLoading,
      );

  Future<CommitteeMemberModel?> postCommitteemembers({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String designation,
  }) async =>
      await repository.postCommitteemembers(
        page: page,
        limit: limit,
        search: search,
        designation: designation,
        isLoading: isLoading,
      );

  Future<DonarListModel?> postDonatorsList({
    bool isLoading = false,
  }) async =>
      await repository.postDonatorsList(
        isLoading: isLoading,
      );

  Future<GetOneDonarModel?> postDonators({
    required String fundId,
    bool isLoading = false,
  }) async =>
      await repository.postDonators(
        fundId: fundId,
        isLoading: isLoading,
      );

  Future<GalleryModel?> postGallery({
    required int page,
    required int limit,
    bool isLoading = false,
  }) async =>
      await repository.postGallery(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<ServiceModel?> postServiceActivities({
    required int page,
    required int limit,
    bool isLoading = false,
  }) async =>
      await repository.postServiceActivities(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneGalleryModel?> postGetOneGallery({
    required String galleryId,
    bool isLoading = false,
  }) async =>
      await repository.postGetOneGallery(
        galleryId: galleryId,
        isLoading: isLoading,
      );

  Future<GetOneNotificationModel?> postGetOneNotification({
    required String messageId,
    bool isLoading = false,
  }) async =>
      await repository.postGetOneNotification(
        messageId: messageId,
        isLoading: isLoading,
      );

  Future<AdsListModel?> getAds({
    bool isLoading = false,
  }) async =>
      await repository.getAds(
        isLoading: isLoading,
      );

  Future<VillageListDataModel?> getAllVillage({
    required int page,
    required int limit,
    required String search,
    bool isLoading = false,
  }) async =>
      await repository.getAllVillage(
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
      await repository.postQualifiedPrizes(
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
      await repository.postQualifiedStationery(
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
      await repository.postDownloadStationery(
        resultId: resultId,
        isLoading: isLoading,
      );

  Future<PriceCouponModel?> postDownloadPrize({
    required String resultId,
    bool isLoading = false,
  }) async =>
      await repository.postDownloadPrize(
        resultId: resultId,
        isLoading: isLoading,
      );

  Future<EducationModel?> postStudiesList({
    bool isLoading = false,
    required String? search,
  }) async =>
      await repository.postStudiesList(
        isLoading: isLoading,
        search: search,
      );
}
