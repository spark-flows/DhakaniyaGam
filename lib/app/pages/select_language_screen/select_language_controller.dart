import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/repositories/repositories.dart';
import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  SelectLanguageController(this.selectLanguagePresenter);

  final SelectLanguagePresenter selectLanguagePresenter;

  int selectedOption = 1;

  @override
  void onInit() {
    if (Get.find<Repository>().getStringValue(LocalKeys.language) == 'en') {
      selectedOption = 1;
    } else {
      selectedOption = 2;
    }
    update();
    super.onInit();
  }
}
