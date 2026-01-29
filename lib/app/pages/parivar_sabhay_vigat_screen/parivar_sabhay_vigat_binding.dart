import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/pages/pages.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:dhakaniya_gam/domain/usecases/usecases.dart';
import 'package:get/get.dart';

class ParivarSabhayVigatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParivarSabhayVigatController>(
      () => ParivarSabhayVigatController(
        Get.put(
          ParivarSabhayVigatPresenter(
            Get.put(
              ParivarSabhayVigatUsecases(
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
    Get.put<HomeController>(
      HomeController(
        Get.put(
          HomePresenter(
            Get.put(
              HomeUsecases(
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
