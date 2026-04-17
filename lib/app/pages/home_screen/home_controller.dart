import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;

  @override
  void onInit() {
    postSettingApi();
    getProfileApi();
    super.onInit();
  }

  String? selectValue = "All";

  List<String> categoryLists = [
    "All",
    "Gordaka",
    "Botad",
  ];

  GetProfileData? getProfileData = GetProfileData();

  Future<void> getProfileApi() async {
    var response = await homePresenter.getProfileApi(
      isLoading: true,
    );
    Utility.profileData = null;
    if (response != null) {
      Utility.notificationCount = response.data?.notificationCount ?? 0;
      Utility.profileData = response.data;
      Utility.prifilePic = response.data?.profilePic ?? "";
      getProfileData = response.data;
      selectVillageValue = getProfileData?.village?.id;
    }
    update();
  }

  String? selectVillageValue = "";

  List<VillageDatum> villageList = [
    VillageDatum(gujaratiName: "All", id: ''),
  ];

  Future<void> villagesApi() async {
    var response = await homePresenter.villagesApi(
      search: "",
      isLoading: false,
    );
    if (response != null) {
      villageList = [
        VillageDatum(gujaratiName: "All", id: ''),
      ];
      villageList.addAll(
        response.data ?? [],
      );
      update();
    }
  }

  Future<void> postSettingApi() async {
    var response = await homePresenter.postSettingApi(
      isLoading: false,
    );
    if (response?.status == 200) {
      if (response?.data?.resultOn == true &&
          response?.data?.services == true) {
        Get.find<Repository>().saveValue("Result", response?.data?.resultOn);
      }
    }
  }
}
