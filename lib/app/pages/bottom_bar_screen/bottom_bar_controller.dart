import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  BottomBarController(this.bottomBarPresenter);

  final BottomBarPresenter bottomBarPresenter;

  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  @override
  void onInit() {
    SocketConnection.initSocket();
    FirebaseApi().initNotification();

    getProfileApi();
    super.onInit();
  }

  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    DashboardScreen(),
    NotificationScreen(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
  // GetProfileData? getProfileData = GetProfileData();

  Future<void> getProfileApi() async {
    var response = await bottomBarPresenter.getProfileApi(
      isLoading: true,
    );
    Utility.profileData = null;
    if (response != null) {
      Utility.profileData = response.data;
      Utility.prifilePic = response.data?.profilePic ?? "";

      // getProfileData = response.data;
    }
    update();
  }
}
