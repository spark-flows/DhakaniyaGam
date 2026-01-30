import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (controller) {
        return Scaffold(
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: ColorsValue.maincolor,
          //   elevation: 0,
          //   onPressed: () {
          //     RouteManagement.goToSevaoScreen();
          //   },
          //   shape: RoundedRectangleBorder(
          //     side: BorderSide(width: 5, color: ColorsValue.lightMainColor),
          //     borderRadius: BorderRadius.circular(100),
          //   ),
          //   child: SvgPicture.asset(
          //     AssetConstants.ic_service,
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: ColorsValue.lightMainColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetConstants.ic_outline_home,
                  colorFilter: ColorFilter.mode(
                    ColorsValue.maincolor,
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  AssetConstants.ic_home,
                  colorFilter: ColorFilter.mode(
                    ColorsValue.maincolor,
                    BlendMode.srcIn,
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetConstants.ic_outline_noti,
                  colorFilter: ColorFilter.mode(
                    ColorsValue.maincolor,
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  AssetConstants.ic_notification,
                  colorFilter: ColorFilter.mode(
                    ColorsValue.maincolor,
                    BlendMode.srcIn,
                  ),
                ),
                label: "Notification",
              ),
            ],
            selectedLabelStyle: Styles.main50012,
            unselectedLabelStyle: Styles.grey9BA0A850012,
            currentIndex: controller.selectedIndex,
            unselectedIconTheme: IconThemeData(
              color: ColorsValue.grey9BA0A8,
            ),
            selectedItemColor: ColorsValue.maincolor,
            selectedIconTheme: IconThemeData(
              color: ColorsValue.maincolor,
            ),
            onTap: controller.onItemTapped,
            elevation: 5,
          ),
          body: Center(
            child: controller.widgetOptions.elementAt(controller.selectedIndex),
          ),
        );
      },
    );
  }
}
