import 'package:dhakaniya_gam/app/pages/pages.dart';
import 'package:dhakaniya_gam/domain/repositories/repository.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/local_storage_keys.dart';
import '../../navigators/navigators.dart';

class SplashController extends GetxController {
  SplashController(this.splashPresenter);

  final SplashPresenter splashPresenter;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      var token = Get.find<Repository>().getStringValue(LocalKeys.authToken);
      if (token.isNotEmpty) {
        RouteManagement.goToBottomBarScreen();
      } else {
        RouteManagement.goToLoginScreen();
        // RouteManagement.goToIntroThiredScreen();
      }

      // var token = Get.find<Repository>()
      //             .getStringValue(LocalKeys.authToken);
      //         if (token.isNotEmpty) {
      //           RouteManagement.goToBottomBarScreen();
      //         } else {
      //           RouteManagement.goToLoginScreen();
      //         }
    });
  }
}
