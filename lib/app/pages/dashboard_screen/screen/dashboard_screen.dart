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
              // Stack(
              //   children: [
              SizedBox(
                height: Dimens.twoHundredNintyOne,
                width: double.maxFinite,
                child: PageView.builder(
                  itemCount: controller.adsList.length,
                  onPageChanged: (value) {
                    controller.selectAds = value;
                    controller.update();
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        RouteManagement.goToShowFullScareenImage(
                            controller.adsList[index].banner ?? "", "IMG");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimens.six),
                        child: CachedNetworkImage(
                          imageUrl: ApiWrapper.imageUrl +
                              (controller.adsList[index].banner ?? ""),
                          fit: BoxFit.cover,
                          width: double.maxFinite,
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
                    );
                  },
                ),
              ),
              Dimens.boxHeight10,
              Center(
                child: Wrap(
                  children: controller.adsList.asMap().entries.map(
                    (e) {
                      return Container(
                        margin: Dimens.edgeInsetsRight6,
                        height: Dimens.ten,
                        width: Dimens.ten,
                        decoration: BoxDecoration(
                          color: controller.selectAds == e.key
                              ? ColorsValue.maincolor
                              : ColorsValue.lightMainColor,
                          borderRadius: BorderRadius.circular(
                            Dimens.hundred,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
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
