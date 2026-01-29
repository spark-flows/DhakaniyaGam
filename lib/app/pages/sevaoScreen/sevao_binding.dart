import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:dhakaniya_gam/domain/usecases/usecases.dart';
import 'package:get/get.dart';

class SevaoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SevaoController>(
      () => SevaoController(
        Get.put(
          SevaoPresenter(
            Get.put(
              SevaoUsecases(
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
