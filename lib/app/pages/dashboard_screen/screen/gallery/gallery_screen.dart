import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/api_wrapper.dart';
import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      initState: (state) {
        var controller = Get.find<DashboardController>();
        controller.galleryPagingController = PagingController(firstPageKey: 1);
        controller.galleryPagingController
            .addPageRequestListener((pagekey) async {
          await controller.postGallery(pagekey, 'gallery');
        });
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
          body: RefreshIndicator(
            onRefresh: () => Future.sync(
              () => controller.pagingCommitteeController.refresh(),
            ),
            child: PagedListView<int, GalleryDoc>(
              padding: Dimens.edgeInsets20,
              pagingController: controller.galleryPagingController,
              builderDelegate: PagedChildBuilderDelegate<GalleryDoc>(
                noItemsFoundIndicatorBuilder: (_) {
                  return Center(
                    child: Text(
                      "${'gallery'.tr} ડેટા મળ્યો નથી...!",
                      style: Styles.mainGuj50014,
                    ),
                  );
                },
                itemBuilder: (context, item, index) {
                  return InkWell(
                    onTap: () {
                      RouteManagement.goToGalleryDetailsScreen(item.id ?? "");
                    },
                    child: Padding(
                      padding: Dimens.edgeInsetsBottom10,
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimens.six),
                            ),
                            border: Border.all(color: ColorsValue.color393185)),
                        child: Padding(
                          padding: Dimens.edgeInsets20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.subject ?? "",
                                style: Styles.color39318560018,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                Utility.parseTimeStamptoDDMMYY(
                                    item.createTimestamp ?? 0),
                                style: Styles.colorACACAC60012,
                              ),
                              Dimens.boxHeight30,
                              Center(
                                child: SizedBox(
                                    width: double.maxFinite,
                                    height: Dimens.twoHundredFifty,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.ten,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: ApiWrapper.imageUrl +
                                            (item.primary?.path ?? ""),
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
                                    )),
                              ),
                              Dimens.boxHeight10,
                              Text(
                                Utility.removeAllHtmlTags(
                                    item.description ?? ""),
                                style: Styles.colorABADB060012,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
