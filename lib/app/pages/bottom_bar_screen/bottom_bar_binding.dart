import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/pages/pages.dart';
import 'package:dhakaniya_gam/domain/usecases/usecases.dart';
import 'package:get/get.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(
        Get.put(
          BottomBarPresenter(
            Get.put(
              BottomBarUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
            Get.put(
              CommonUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
    Get.put<DashboardController>(
      DashboardController(
        Get.put(
          DashboardPresenter(
            Get.put(
              DashboardUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
            Get.put(
              CommonUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
    Get.put<NotificationController>(
      NotificationController(
        Get.put(
          NotificationPresenter(
            Get.put(
              NotificationUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
            Get.put(
              CommonUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
    Get.put<ProfileController>(
      ProfileController(
        Get.put(
          ProfilePresenter(
            Get.put(
              ProfileUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
    Get.put<SelectLanguageController>(
      SelectLanguageController(
        Get.put(
          SelectLanguagePresenter(
            Get.put(
              SelectLanguageUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
  }
}
