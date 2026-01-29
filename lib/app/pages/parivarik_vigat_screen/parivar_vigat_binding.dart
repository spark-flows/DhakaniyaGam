import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/usecases/usecases.dart';
import 'package:get/get.dart';

class ParivarikVigatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParivarikVigatController>(
      () => ParivarikVigatController(
        Get.put(
          ParivarikVigatPresenter(
            Get.put(
              ParivarikVigatUsecases(
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
