import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QualifyStationeryListScreen extends StatelessWidget {
  const QualifyStationeryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.twenty),
              bottomRight: Radius.circular(Dimens.twenty),
            ),
          ),
          backgroundColor: ColorsValue.white,
          elevation: Dimens.ten,
          centerTitle: true,
          leading: InkWell(
            onTap: () {Navigator.pop(context);
            },
            child: Padding(
              padding: Dimens.edgeInsets12,
              child: SvgPicture.asset(
                AssetConstants.ic_left_arrow,
              ),
            ),
          ),
          title: Text(
            'select_stationery'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20,
          child: ListView.builder(
            itemCount: controller.categoryGiftLists.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (controller.categoryGiftLists[index].split(' ').first ==
                          "Std" ||
                      controller.categoryGiftLists[index].split(' ').first ==
                          "College") {
                    RouteManagement.goToQualifyStationeryScreen(
                        controller.categoryGiftLists[index], false);
                  } else {
                    RouteManagement.goToQualifyStationeryScreen(
                        controller.categoryGiftLists[index], true);
                  }
                },
                child: Padding(
                  padding: Dimens.edgeInsets00_10_00_10,
                  child: Container(
                    height: Dimens.sixtySix,
                    padding: Dimens.edgeInsets20_00_20_00,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Dimens.six,
                      ),
                      border: Border.all(
                        color: ColorsValue.maincolor,
                        width: Dimens.one,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.categoryGiftLists[index],
                            style: Styles.mainGuj90018,
                          ),
                          SvgPicture.asset(
                            AssetConstants.ic_arrow_right,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
