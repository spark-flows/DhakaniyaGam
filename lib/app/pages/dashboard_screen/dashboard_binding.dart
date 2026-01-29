import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/pages/pages.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:dhakaniya_gam/domain/usecases/common_usecases.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(
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
  }
}
