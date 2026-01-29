import 'package:dhakaniya_gam/domain/domain.dart';

class BottomBarPresenter {
  BottomBarPresenter(this.bottomBarUsecases, this.commonUsecases);

  final BottomBarUsecases bottomBarUsecases;
  final CommonUsecases commonUsecases;

  Future<GetProfileModel?> getProfileApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getProfileApi(
        isLoading: isLoading,
      );
}
