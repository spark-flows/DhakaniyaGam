import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:get/get.dart';

class VideshSabhayVigatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideshSabhayVigatController>(
      () => VideshSabhayVigatController(
        Get.put(
          VideshSabhayVigatPresenter(
            Get.put(
              VideshSabhayVigatUsecases(
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
