import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      initState: (state) {
        var controller = Get.find<NotificationController>();
        controller.pagingCommitteeController =
            PagingController(firstPageKey: 1);
        controller.pagingCommitteeController
            .addPageRequestListener((pageKey) async {
          await controller.getAllNotification(pageKey);
        });
      },
      builder: (controller) {
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
                Padding(
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
                    child: InkWell(
                      onTap: () {
                        RouteManagement.goToProfileScreen();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Dimens.hundred,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: ApiWrapper.imageUrl +
                              (Utility.profileData?.profilePic ?? ""),
                          fit: BoxFit.cover,
                          maxWidthDiskCache: 90,
                          maxHeightDiskCache: 90,
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
          body: RefreshIndicator(
            onRefresh: () => Future.sync(
              () => controller.pagingCommitteeController.refresh(),
            ),
            child: PagedListView<int, GetAllMessageDoc>(
              padding: Dimens.edgeInsets20,
              pagingController: controller.pagingCommitteeController,
              builderDelegate: PagedChildBuilderDelegate<GetAllMessageDoc>(
                noItemsFoundIndicatorBuilder: (_) {
                  return Center(
                    child: Text(
                      "Data Not Found...!",
                      style: Styles.main60018,
                    ),
                  );
                },
                itemBuilder: (context, item, index) {
                  return GestureDetector(
                    onTap: () {
                      RouteManagement.goToNotificationDetailsScreen(
                          item.id ?? "");
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
                              if (item.documents?.isNotEmpty ?? false) ...[
                                SizedBox(
                                  height: Dimens.twoHundredFifty,
                                  child: PageView.builder(
                                    itemCount: item.documents?.length,
                                    onPageChanged: (value) {
                                      controller.selectNotificationPage = value;
                                      controller.update();
                                    },
                                    itemBuilder: (context, index) {
                                      var itemImg = item.documents?[index];
                                      return ClipRRect(
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
                                      );
                                    },
                                  ),
                                ),
                                Dimens.boxHeight10,
                                Center(
                                  child: Wrap(
                                    children: item.documents
                                            ?.asMap()
                                            .entries
                                            .map((e) {
                                          return Padding(
                                            padding: Dimens.edgeInsetsLeft5,
                                            child: Container(
                                              width: Dimens.ten,
                                              height: Dimens.ten,
                                              decoration: BoxDecoration(
                                                color: controller
                                                            .selectNotificationPage ==
                                                        e.key
                                                    ? ColorsValue.maincolor
                                                    : ColorsValue
                                                        .lightMainColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimens.twenty),
                                              ),
                                            ),
                                          );
                                        }).toList() ??
                                        [],
                                  ),
                                ),
                                Dimens.boxHeight10,
                              ],
                              Text(
                                Utility.removeAllHtmlTags(
                                    item.description ?? ""),
                                style: Styles.colorACACAC60012,
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
