import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.white,
        appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            Dimens.seventy,
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: Dimens.hundred,
            leading: Padding(
              padding: Dimens.edgeInsetsLeft20,
              child: Image.asset(
                AssetConstants.app_logo,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  RouteManagement.goToProfileScreen();
                },
                child: Padding(
                  padding: Dimens.edgeInsetsRight20,
                  child: Container(
                    height: Dimens.fourty,
                    width: Dimens.fourty,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimens.hundred,
                      ),
                      color: ColorsValue.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        Dimens.hundred,
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            ApiWrapper.imageUrl + (Utility.prifilePic ?? ""),
                        maxWidthDiskCache: 90,
                        maxHeightDiskCache: 90,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Image.asset(AssetConstants.usera);
                        },
                        errorWidget: (context, url, error) {
                          return Image.asset(AssetConstants.usera);
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: Dimens.edgeInsets20_0_20_20,
          children: [
            if (controller.adsList.isNotEmpty) ...[
              SizedBox(
                height: Dimens.twoHundredNintyOne,
                width: double.maxFinite,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollStartNotification) {
                      controller.stopAutoScroll();
                    } else if (notification is ScrollEndNotification) {
                      controller.startAutoScroll();
                    }
                    return false;
                  },
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.adsList.length,
                    onPageChanged: (value) {
                      controller.selectAds = value;
                      controller.update();
                    },
                    allowImplicitScrolling: true,
                    itemBuilder: (context, index) {
                      final isActive = controller.selectAds == index;
                      return AnimatedScale(
                        scale: isActive ? 1.0 : 0.92,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimens.four,
                            vertical: isActive ? 0 : Dimens.twelve,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsValue.white,
                            borderRadius: BorderRadius.circular(Dimens.sixteen),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: ColorsValue.maincolor
                                          .withOpacity(0.25),
                                      blurRadius: Dimens.twelve,
                                      offset: const Offset(0, 6),
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: Dimens.four,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                          ),
                          child: InkWell(
                            onTap: () {
                              RouteManagement.goToShowFullScareenImage(
                                  controller.adsList[index].banner ?? "",
                                  "IMG");
                            },
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Dimens.sixteen),
                              child: CachedNetworkImage(
                                imageUrl: ApiWrapper.imageUrl +
                                    (controller.adsList[index].banner ?? ""),
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                                height: double.maxFinite,
                                placeholder: (context, url) => Center(
                                  child: Image.asset(
                                    AssetConstants.placeholder,
                                    fit: BoxFit.cover,
                                    width: double.maxFinite,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Center(
                                  child: Image.asset(
                                    AssetConstants.placeholder,
                                    fit: BoxFit.cover,
                                    width: double.maxFinite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Dimens.boxHeight12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.adsList.asMap().entries.map(
                  (e) {
                    final isActive = controller.selectAds == e.key;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: Dimens.edgeInsetsRight6,
                      height: Dimens.eight,
                      width: isActive ? Dimens.twentyFour : Dimens.eight,
                      decoration: BoxDecoration(
                        color: isActive
                            ? ColorsValue.maincolor
                            : ColorsValue.lightMainColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.hundred,
                        ),
                      ),
                    );
                  },
                ).toList(),
              )
            ],
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.titleList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        RouteManagement.goToSevaKiyParvutiScreen();
                      case 1:
                        RouteManagement.goToSabhayYadiScreen();
                      case 2:
                        RouteManagement.goToTalukaRepresentativeScreen();
                      case 3:
                        RouteManagement.goToDonorsScreen();
                      case 4:
                        RouteManagement.goToUploadResultListScreen();
                      case 5:
                        RouteManagement.goToQualifyPrizeListScreen();
                      case 6:
                        RouteManagement.goToParivarSabhayVigatListScreen();
                      case 7:
                        RouteManagement.goToGalleryScreen();
                    }
                  },
                  child: Padding(
                    padding: Dimens.edgeInsets00_10_00_10,
                    child: Container(
                      height: Dimens.sixtySix,
                      padding: Dimens.edgeInsets20_00_20_00,
                      decoration: BoxDecoration(
                        color: ColorsValue.white,
                        border: Border.all(
                          width: Dimens.one,
                          color: ColorsValue.maincolor,
                        ),
                        borderRadius: BorderRadius.circular(
                          Dimens.six,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.titleList[index],
                            style: Styles.mainGuj90018,
                          ),
                          SvgPicture.asset(AssetConstants.ic_arrow_right)
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      );
    });
  }
}
