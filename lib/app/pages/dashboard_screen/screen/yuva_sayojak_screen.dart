import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class YuvaSayojakScreen extends StatelessWidget {
  const YuvaSayojakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<DashboardController>(initState: (state) {
      var controller = Get.find<DashboardController>();
      controller.searchPresidentController.clear();
      controller.pagingCommitteeController = PagingController(firstPageKey: 1);
      controller.pagingCommitteeController
          .addPageRequestListener((pageKey) async {
        await controller.postCommitteemembers(
          pageKey,
          "youth_coordinator",
        );
      });
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.twenty),
              bottomRight: Radius.circular(Dimens.twenty),
            ),
          ),
          backgroundColor: Colors.white,
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
              ),
            ),
          ),
          title: Text(
            'youth_coordinator_mr'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20_00_20_00,
          child: Column(
            children: [
              CustomTextFormField(
                text: "",
                controller: controller.searchPresidentController,
                hintText: 'Search',
                fillColor: ColorsValue.greyEEEEEE,
                prefixIcon: Padding(
                  padding: Dimens.edgeInsets10,
                  child: SvgPicture.asset(
                    AssetConstants.ic_search,
                  ),
                ),
                onChanged: (value) {
                  _debouncer.run(() {
                    Future.sync(
                      () {
                        return controller.pagingCommitteeController.refresh();
                      },
                    );
                  });
                },
              ),
              Dimens.boxHeight20,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => Future.sync(
                    () => controller.pagingCommitteeController.refresh(),
                  ),
                  child: PagedListView<int, CommitteeMemberDocs>(
                    pagingController: controller.pagingCommitteeController,
                    builderDelegate:
                        PagedChildBuilderDelegate<CommitteeMemberDocs>(
                      noItemsFoundIndicatorBuilder: (_) {
                        return Center(
                          child: Text(
                            "Data Not Found...!",
                            style: Styles.main60018,
                          ),
                        );
                      },
                      itemBuilder: (context, item, index) {
                        return InkWell(
                          onTap: () {
                            RouteManagement.goToSabhayYadiDeatilsScreen(
                                item.user?.id ?? "");
                          },
                          child: Padding(
                            padding: Dimens.edgeInsets00_10_00_10,
                            child: Container(
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
                                child: ListTile(
                                  contentPadding: Dimens.edgeInsets15_00_15_00,
                                  leading: Container(
                                    height: Dimens.fifty,
                                    width: Dimens.fifty,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.hundred,
                                      ),
                                      color: ColorsValue.maincolor,
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.hundred),
                                      child: CachedNetworkImage(
                                        imageUrl: ApiWrapper.imageUrl +
                                            (item.user?.profilePic ?? ""),
                                        fit: BoxFit.cover,
                                        maxHeightDiskCache: 90,
                                        maxWidthDiskCache: 90,
                                        width: Dimens.fifty,
                                        height: Dimens.fifty,
                                        placeholder: (context, url) =>
                                            Image.asset(
                                          AssetConstants.usera,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          AssetConstants.usera,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "${item.user?.name} ${item.user?.fathername} ${item.user?.surname}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Styles.blackGuj60018,
                                  ),
                                  subtitle: Padding(
                                    padding: Dimens.edgeInsetsTopt10,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: Dimens.thirty,
                                          padding: Dimens.edgeInsets05_00_05_00,
                                          decoration: BoxDecoration(
                                            color: ColorsValue.lightMainColor,
                                            borderRadius: BorderRadius.circular(
                                              Dimens.six,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "યુવા સંયોજક",
                                              style: Styles.mainGuj60016,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "(${item.village?.gujaratiName})",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.blackGuj60012,
                                        )
                                      ],
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
              ),
            ],
          ),
        ),
      );
    });
  }
}
