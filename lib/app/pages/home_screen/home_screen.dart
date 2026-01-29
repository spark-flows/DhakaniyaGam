import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.white,
        appBar: AppBar(
          backgroundColor: ColorsValue.white,
          elevation: Dimens.ten,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: Dimens.edgeInsets12,
              child: SvgPicture.asset(
                AssetConstants.ic_left_arrow,
                colorFilter: ColorFilter.mode(
                  ColorsValue.maincolor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          padding: Dimens.edgeInsets20,
          children: [
            Image.asset(
              AssetConstants.app_logo,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'village_name'.tr,
                style: Styles.grey9BA0A8Guj90016,
              ),
            ),
            // Container(
            //   height: Dimens.fourtyFive,
            //   padding: Dimens.edgeInsets20_00_20_00,
            //   decoration: BoxDecoration(
            //     color: ColorsValue.greyEEEEEE,
            //     borderRadius: BorderRadius.circular(
            //       Dimens.six,
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         controller.getProfileData?.village?.gujaratiName ?? "",
            //         style: Styles.black2E363F50014,
            //       ),
            //       SvgPicture.asset(
            //         AssetConstants.ic_down_arrow,
            //       ),
            //     ],
            //   ),
            // ),

            Container(
              height: Dimens.fifty,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.six),
                color: ColorsValue.greyEEEEEE,
              ),
              child: DropdownButton<String>(
                underline: Container(),
                hint: Text(
                  controller.getProfileData?.village?.gujaratiName ?? "",
                  style: Styles.grey9BA0A8Guj90016,
                ),
                padding: EdgeInsets.only(
                  left: Dimens.ten,
                  right: Dimens.ten,
                ),
                isExpanded: true,
                icon: SvgPicture.asset(
                  AssetConstants.ic_down_arrow,
                ),
                value: controller.selectVillageValue,
                items: controller.getProfileData?.village?.gujaratiName
                            ?.isNotEmpty ??
                        false
                    ? []
                    : controller.villageList
                        .map((value) => DropdownMenuItem(
                              value: value.id,
                              child: Text(value.gujaratiName ?? ""),
                            ))
                        .toList(),
                onChanged: controller.getProfileData?.village?.gujaratiName
                            ?.isNotEmpty ??
                        false
                    ? (va) {}
                    : (newValue) {
                        controller.selectVillageValue = newValue;
                        controller.update();
                      },
              ),
            ),
            Dimens.boxHeight30,
            InkWell(
              onTap: () {
                RouteManagement.goToParivarikVigatScreen();
              },
              child: Container(
                height: Dimens.sixtySix,
                decoration: BoxDecoration(
                  color: ColorsValue.white,
                  border: Border.all(
                    color: ColorsValue.maincolor,
                    width: Dimens.one,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    dense: true,
                    leading: SvgPicture.asset(
                      AssetConstants.ic_done,
                    ),
                    title: Text(
                      'parivar_vigat'.tr,
                      style: Styles.mainGuj90018,
                    ),
                    trailing: SvgPicture.asset(AssetConstants.ic_arrow_right),
                  ),
                ),
              ),
            ),
            Dimens.boxHeight20,
            InkWell(
              onTap: () {
                RouteManagement.goToParivarSabhayVigatListScreen();
              },
              child: Container(
                height: Dimens.sixtySix,
                decoration: BoxDecoration(
                  color: ColorsValue.white,
                  border: Border.all(
                    color: ColorsValue.maincolor,
                    width: Dimens.one,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    dense: true,
                    leading: SvgPicture.asset(
                      AssetConstants.ic_done,
                    ),
                    title: Text(
                      'parivar_sabhay_vigat'.tr,
                      style: Styles.mainGuj90018,
                    ),
                    trailing: SvgPicture.asset(AssetConstants.ic_arrow_right),
                  ),
                ),
              ),
            ),
            Dimens.boxHeight20,
            InkWell(
              onTap: () {
                RouteManagement.goToVideshSabhayVigatListScreen();
              },
              child: Container(
                height: Dimens.sixtySix,
                decoration: BoxDecoration(
                  color: ColorsValue.white,
                  border: Border.all(
                    color: ColorsValue.maincolor,
                    width: Dimens.one,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    dense: true,
                    leading: SvgPicture.asset(
                      AssetConstants.ic_done,
                    ),
                    title: Text(
                      'videsh_vasta_sabhay'.tr,
                      style: Styles.mainGuj90018,
                    ),
                    trailing: SvgPicture.asset(AssetConstants.ic_arrow_right),
                  ),
                ),
              ),
            ),
            Dimens.boxHeight20,
            InkWell(
              onTap: () {
                RouteManagement.goToOtherDetailsScreen();
              },
              child: Container(
                height: Dimens.sixtySix,
                decoration: BoxDecoration(
                  color: ColorsValue.white,
                  border: Border.all(
                    color: ColorsValue.maincolor,
                    width: Dimens.one,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    dense: true,
                    leading: SvgPicture.asset(
                      AssetConstants.ic_done,
                    ),
                    title: Text(
                      'other_vigat'.tr,
                      style: Styles.mainGuj90018,
                    ),
                    trailing: SvgPicture.asset(AssetConstants.ic_arrow_right),
                  ),
                ),
              ),
            ),
            Dimens.boxHeight60,
            // CustomButton(
            //   onPressed: () {
            //     RouteManagement.goToSelectLanguageScreen();
            //   },
            //   text: 'get_started'.tr,
            // )
          ],
        ),
      );
    });
  }
}
