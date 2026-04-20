import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class QualifyStationeryScreen extends StatelessWidget {
  const QualifyStationeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<DashboardController>(initState: (state) {
      var controller = Get.find<DashboardController>();
      controller.std = Get.arguments[0] ?? "";
      controller.isMedium = Get.arguments[1] ?? false;
      controller.qualifyStationeryPagingController =
          PagingController(firstPageKey: 1);
      controller.qualifyStationeryPagingController
          .addPageRequestListener((pagekey) async {
        await controller.postQualifiedStationery(pagekey);
      });
      controller.qualifyStationeryController.clear();
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
            'select_stationery'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20_00_20_00,
          child: Column(
            children: [
              CustomTextFormField(
                controller: controller.qualifyStationeryController,
                text: "",
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
                        return controller.qualifyStationeryPagingController
                            .refresh();
                      },
                    );
                  });
                },
              ),
              Dimens.boxHeight20,
              //   Expanded(
              //       child: RefreshIndicator(
              //     onRefresh: () => Future.sync(
              //       () => controller.qualifyStationeryPagingController.refresh(),
              //     ),
              //     child: PagedListView<int, QualifiedPrizeDoc>(
              //       pagingController:
              //           controller.qualifyStationeryPagingController,
              //       builderDelegate: PagedChildBuilderDelegate<QualifiedPrizeDoc>(
              //         noItemsFoundIndicatorBuilder: (context) {
              //           return Center(
              //             child: Text("No data found...!"),
              //           );
              //         },
              //         itemBuilder: (context, item, index) {
              //           return Padding(
              //             padding: Dimens.edgeInsets00_10_00_10,
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(
              //                   Dimens.six,
              //                 ),
              //                 border: Border.all(
              //                   color: ColorsValue.maincolor,
              //                   width: Dimens.one,
              //                 ),
              //               ),
              //               child: Center(
              //                 child: ListTile(
              //                   contentPadding: Dimens.edgeInsets15_00_15_00,
              //                   title: Text(
              //                     "${item.familymember?.name} ${item.familymember?.fathername} ${item.familymember?.surname}",
              //                     maxLines: 2,
              //                     overflow: TextOverflow.ellipsis,
              //                     style: Styles.blackGuj60018,
              //                   ),
              //                   subtitle: Padding(
              //                     padding: Dimens.edgeInsetsTopt10,
              //                     child: Row(
              //                       mainAxisSize: MainAxisSize.min,
              //                       children: [
              //                         Container(
              //                           height: Dimens.thirty,
              //                           padding: Dimens.edgeInsets10_00_10_00,
              //                           decoration: BoxDecoration(
              //                             color: ColorsValue.lightMainColor,
              //                             borderRadius: BorderRadius.circular(
              //                               Dimens.six,
              //                             ),
              //                           ),
              //                           child: Center(
              //                             child: Text(
              //                               item.percentage.toString(),
              //                               style: Styles.mainGuj60016,
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   ))
            ],
          ),
        ),
      );
    });
  }
}
