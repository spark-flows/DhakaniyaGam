import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/routes_management.dart';
import 'package:dhakaniya_gam/data/helpers/helpers.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SevaKiyParvutiScreen extends StatelessWidget {
  const SevaKiyParvutiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<DashboardController>(
      initState: (state) {
        var controller = Get.find<DashboardController>();
        controller.servicePagingController = PagingController(firstPageKey: 1);
        controller.servicePagingController
            .addPageRequestListener((pagekey) async {
          await controller.postServiceActivities(pagekey);
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
              'service_activity'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () => Future.sync(
              () => controller.pagingCommitteeController.refresh(),
            ),
            child: PagedListView<int, ServiceDoc>(
              pagingController: controller.servicePagingController,
              builderDelegate: PagedChildBuilderDelegate<ServiceDoc>(
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
                      RouteManagement.goToShowFullScareenImage(
                          item.path ?? "", "IMG");
                    },
                    child: Padding(
                      padding: Dimens.edgeInsets20_10_20_10,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorsValue.maincolor,
                          borderRadius: BorderRadius.circular(
                            Dimens.six,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.maincolor,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimens.six),
                          child: CachedNetworkImage(
                            imageUrl: ApiWrapper.imageUrl + (item.path ?? ""),
                            fit: BoxFit.cover,
                            maxHeightDiskCache: 500,
                            maxWidthDiskCache: 500,
                            placeholder: (context, url) => Image.asset(
                              AssetConstants.placeholder,
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              AssetConstants.placeholder,
                              fit: BoxFit.cover,
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
        );
      },
    );
  }
}
