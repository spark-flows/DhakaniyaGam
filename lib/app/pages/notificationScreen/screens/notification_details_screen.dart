import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/api_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      initState: (state) {
        var controller = Get.find<NotificationController>();
        controller.postGetOneNotification(Get.arguments ?? "");
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
                'notification'.tr,
                style: Styles.mainGuj90020,
              ),
            ),
            body: controller.getAllMessageDoc != null
                ? Padding(
                    padding: Dimens.edgeInsetsBottom10,
                    child: Padding(
                      padding: Dimens.edgeInsets20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.getAllMessageDoc?.subject ?? "",
                            style: Styles.color39318560018,
                          ),
                          Dimens.boxHeight10,
                          Text(
                            Utility.parseTimeStamptoDDMMYY(
                                controller.getAllMessageDoc?.createTimestamp ??
                                    0),
                            style: Styles.colorACACAC60012,
                          ),
                          if (controller
                                  .getAllMessageDoc?.documents?.isNotEmpty ??
                              false) ...[
                            Dimens.boxHeight30,
                            SizedBox(
                              height: Dimens.threeHundredFifty,
                              child: PageView.builder(
                                itemCount: controller
                                    .getAllMessageDoc?.documents?.length,
                                onPageChanged: (value) {
                                  controller.selectPage = value;
                                  controller.update();
                                },
                                itemBuilder: (context, index) {
                                  var itemImg = controller
                                      .getAllMessageDoc?.documents?[index];
                                  return InkWell(
                                    onTap: () {
                                      RouteManagement.goToShowFullScareenImage(
                                          itemImg?.path ?? "", "Photo");
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.ten,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: ApiWrapper.imageUrl +
                                            (itemImg?.path ?? ""),
                                        fit: BoxFit.cover,
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
                                  );
                                },
                              ),
                            ),
                            Dimens.boxHeight10,
                            Center(
                              child: Wrap(
                                children: controller.getAllMessageDoc?.documents
                                        ?.asMap()
                                        .entries
                                        .map((e) {
                                      return Padding(
                                        padding: Dimens.edgeInsetsLeft5,
                                        child: Container(
                                          width: Dimens.ten,
                                          height: Dimens.ten,
                                          decoration: BoxDecoration(
                                            color: controller.selectPage ==
                                                    e.key
                                                ? ColorsValue.maincolor
                                                : ColorsValue.lightMainColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimens.twenty),
                                          ),
                                        ),
                                      );
                                    }).toList() ??
                                    [],
                              ),
                            ),
                          ],
                          Dimens.boxHeight10,
                          Text(
                            Utility.removeAllHtmlTags(
                                controller.getAllMessageDoc?.description ?? ""),
                            style: Styles.colorABADB060012,
                          ),
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
