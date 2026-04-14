import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/api_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GalleryDetailsScreen extends StatelessWidget {
  const GalleryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      initState: (state) {
        var controller = Get.find<DashboardController>();
        controller.galleryDoc = null;
        controller.postGetOneGallery(Get.arguments ?? "");
        controller.selectGalleryPage = 0;
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
            body: controller.galleryDoc != null
                ? Padding(
                    padding: Dimens.edgeInsetsBottom10,
                    child: Padding(
                      padding: Dimens.edgeInsets20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.galleryDoc?.subject ?? "",
                            style: Styles.color39318560018,
                          ),
                          Dimens.boxHeight10,
                          Text(
                            Utility.parseTimeStamptoDDMMYY(
                                controller.galleryDoc?.createTimestamp ?? 0),
                            style: Styles.colorACACAC60012,
                          ),
                          Dimens.boxHeight30,
                          SizedBox(
                            height: Dimens.threeHundredFifty,
                            child: PageView.builder(
                              itemCount:
                                  controller.galleryDoc?.documents?.length,
                              onPageChanged: (value) {
                                controller.selectGalleryPage = value;
                                controller.update();
                              },
                              itemBuilder: (context, index) {
                                var itemImg =
                                    controller.galleryDoc?.documents?[index];
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
                              children: controller.galleryDoc?.documents
                                      ?.asMap()
                                      .entries
                                      .map((e) {
                                    return Padding(
                                      padding: Dimens.edgeInsetsLeft5,
                                      child: Container(
                                        width: Dimens.ten,
                                        height: Dimens.ten,
                                        decoration: BoxDecoration(
                                          color: controller.selectGalleryPage ==
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
                          Dimens.boxHeight10,
                          Text(
                            Utility.removeAllHtmlTags(
                                controller.galleryDoc?.description ?? ""),
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
