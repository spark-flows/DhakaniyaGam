import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/api_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AdsDetailsScreen extends StatelessWidget {
  const AdsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      initState: (state) {
        var controller = Get.find<DashboardController>();
        controller.imageList = Get.arguments ?? "";
        controller.startAutoScrollAds();
      },
      builder: (controller) {
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
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: Dimens.edgeInsets12,
                  child: SvgPicture.asset(
                    AssetConstants.ic_left_arrow,
                  ),
                ),
              ),
              title: Text(
                'gallery'.tr,
                style: Styles.mainGuj90020,
              ),
            ),
            body: controller.imageList.isNotEmpty
                ? Padding(
                    padding: Dimens.edgeInsetsBottom10,
                    child: Padding(
                      padding: Dimens.edgeInsets20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Dimens.twoHundredNintyOne,
                            width: double.maxFinite,
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                if (notification is ScrollStartNotification) {
                                  controller.stopAutoScrollAds();
                                } else if (notification
                                    is ScrollEndNotification) {
                                  controller.startAutoScrollAds();
                                }
                                return false;
                              },
                              child: PageView.builder(
                                controller: controller.pageAdsController,
                                itemCount: controller.imageList.length,
                                onPageChanged: (value) {
                                  controller.selectAdsDetails = value;
                                  controller.update();
                                },
                                allowImplicitScrolling: true,
                                itemBuilder: (context, index) {
                                  final isActive =
                                      controller.selectAdsDetails == index;
                                  return AnimatedScale(
                                    scale: isActive ? 1.0 : 0.92,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOutCubic,
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Dimens.four,
                                        vertical: isActive ? 0 : Dimens.twelve,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorsValue.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimens.sixteen),
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
                                                  color: Colors.black
                                                      .withOpacity(0.08),
                                                  blurRadius: Dimens.four,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          RouteManagement
                                              .goToShowFullScareenImage(
                                                  controller.imageList[index],
                                                  "Photo");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Dimens.sixteen),
                                          child: CachedNetworkImage(
                                            imageUrl: ApiWrapper.imageUrl +
                                                controller.imageList[index],
                                            fit: BoxFit.cover,
                                            width: double.maxFinite,
                                            height: double.maxFinite,
                                            placeholder: (context, url) =>
                                                Center(
                                              child: Image.asset(
                                                AssetConstants.placeholder,
                                                fit: BoxFit.cover,
                                                width: double.maxFinite,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) => Center(
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
                            children: controller.imageList.asMap().entries.map(
                              (e) {
                                final isActive =
                                    controller.selectAdsDetails == e.key;
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  margin: Dimens.edgeInsetsRight6,
                                  height: Dimens.eight,
                                  width: isActive
                                      ? Dimens.twentyFour
                                      : Dimens.eight,
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
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}
