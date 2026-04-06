import 'package:dhakaniya_gam/app/app.dart';
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
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.ic_outline_noti,
                      colorFilter: ColorFilter.mode(
                        ColorsValue.maincolor,
                        BlendMode.srcIn,
                      ),
                    ),
                    // if (count  0)
                    Positioned(
                      right: -6,
                      top: -4,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          Utility.notificationCount > 99
                              ? '99+'
                              : '${Utility.notificationCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Obx(() {
                  final count = controller.notificationCount.value;
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(
                        AssetConstants.ic_notification,
                        colorFilter: ColorFilter.mode(
                          ColorsValue.maincolor,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (count > 0)
                        Positioned(
                          right: -6,
                          top: -4,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              count > 99 ? '99+' : '$count',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  );
                }),
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
