import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:dhakaniya_gam/domain/usecases/usecases.dart';

class HomePresenter {
  HomePresenter(this.homeUsecases, this.commonUsecases);

  final HomeUsecases homeUsecases;
  final CommonUsecases commonUsecases;

  Future<GetProfileModel?> getProfileApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getProfileApi(
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

  Future<SettingModel?> postSettingApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.postSettingApi(
        isLoading: isLoading,
      );
}
