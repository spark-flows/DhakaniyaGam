import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/data/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DonorsDetailsScreen extends StatelessWidget {
  const DonorsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      initState: (state) {
        var controller = Get.find<DashboardController>();
        controller.postDonators(Get.arguments[0] ?? "");
        controller.donarName = Get.arguments[1] ?? "";
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.white,
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
              controller.donarName ?? 'donors'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: controller.getOneDonarData != null ||
                    (controller.getOneDonarData?.majorDonators?.isNotEmpty ??
                        false)
                ? ListView(
                    shrinkWrap: true,
                    children: [
                      if (controller
                              .getOneDonarData?.majorDonators?.isNotEmpty ??
                          false) ...[
                        SizedBox(
                          height: Dimens.twoHundredNintyOne,
                          child: PageView.builder(
                            itemCount: controller
                                    .getOneDonarData?.majorDonators?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: Dimens.hundred,
                                    backgroundImage: NetworkImage(
                                      ApiWrapper.imageUrl +
                                          (controller
                                                  .getOneDonarData
                                                  ?.majorDonators?[index]
                                                  .photo ??
                                              ""),
                                    ),
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    controller
                                            .getOneDonarData
                                            ?.majorDonators?[index]
                                            .gujaratiName ??
                                        "",
                                    style: Styles.blackGuj60020,
                                    maxLines: 2,
                                  ),
                                  Dimens.boxHeight6,
                                  Text(
                                    "${controller.getOneDonarData?.majorDonators?[index].year}",
                                    style: Styles.blackGuj60014,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Dimens.boxHeight30,
                      ],
                      if (controller
                              .getOneDonarData?.otherDonators?.isNotEmpty ??
                          false) ...[
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller
                                  .getOneDonarData?.otherDonators?.length ??
                              0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: Dimens.five,
                            crossAxisSpacing: Dimens.five,
                            mainAxisExtent: Dimens.twoHundredThirtySix,
                          ),
                          itemBuilder: (context, index) {
                            var item = controller
                                .getOneDonarData?.otherDonators?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: Dimens.hundredFifty,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: ColorsValue.maincolor,
                                    borderRadius: BorderRadius.circular(
                                      Dimens.ten,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.ten,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: ApiWrapper.imageUrl +
                                          (item?.photo ?? ""),
                                      fit: BoxFit.cover,
                                      maxHeightDiskCache: 500,
                                      maxWidthDiskCache: 500,
                                      placeholder: (context, url) {
                                        return Image.asset(
                                          AssetConstants.placeholder,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                          AssetConstants.placeholder,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Dimens.boxHeight10,
                                Text(
                                  item?.gujaratiName ?? "",
                                  style: Styles.blackGuj60014,
                                  maxLines: 2,
                                ),
                                Dimens.boxHeight6,
                                Text(
                                  "${item?.year}",
                                  style: Styles.blackGuj60012,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ],
                  )
                : Center(
                    child: Text(
                      "${controller.donarName ?? 'donors'.tr} ડેટા મળ્યો નથી...!",
                      style: Styles.mainGuj50014,
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
