import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class QualifyPrizeListScreen extends StatelessWidget {
  const QualifyPrizeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(initState: (state) {
      var controller = Get.find<DashboardController>();
      controller.qualifyPrizeMainPagingController =
          PagingController(firstPageKey: 1);
      controller.qualifyPrizeMainPagingController
          .addPageRequestListener((pagekey) async {
        await controller.postQualifiedPrizesList(pagekey);
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
            'qualify_for_prizes'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20,
          child: Column(
            children: [
              Row(
                spacing: Dimens.ten,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: Dimens.fourty,
                    width: Dimens.hundredTen,
                    padding: Dimens.edgeInsets10_00_10_00,
                    decoration: BoxDecoration(
                      color: ColorsValue.lightMainColor,
                      borderRadius: BorderRadius.circular(Dimens.ten),
                      border: Border.all(
                        color: ColorsValue.maincolor,
                        width: Dimens.one,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.selectMeduium,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: ColorsValue.maincolor,
                        ),
                        style: Styles.mainGuj60016,
                        items: controller.mediumList.map((year) {
                          return DropdownMenuItem<String>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (newYear) {
                          controller.selectMeduium = newYear!;
                          controller.qualifyPrizePagingController.refresh();
                          controller.update();
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: Dimens.fourty,
                    width: Dimens.hundred,
                    padding: Dimens.edgeInsets10_00_10_00,
                    decoration: BoxDecoration(
                      color: ColorsValue.lightMainColor,
                      borderRadius: BorderRadius.circular(Dimens.ten),
                      border: Border.all(
                        color: ColorsValue.maincolor,
                        width: Dimens.one,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: controller.selectYear,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: ColorsValue.maincolor,
                        ),
                        style: Styles.mainGuj60016,
                        items: List.generate(
                          DateTime.now().year - 2025,
                          (index) => DateTime.now().year - index,
                        ).map((year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (int? newYear) {
                          if (newYear != null) {
                            controller.selectYear = newYear;
                            controller.qualifyPrizePagingController.refresh();
                            controller.update();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => Future.sync(
                    () => controller.qualifyPrizeMainPagingController.refresh(),
                  ),
                  child: PagedListView<int, QualifiedPrizeDoc>(
                    pagingController:
                        controller.qualifyPrizeMainPagingController,
                    builderDelegate:
                        PagedChildBuilderDelegate<QualifiedPrizeDoc>(
                      noItemsFoundIndicatorBuilder: (context) {
                        return Center(
                          child: Text("No data found...!"),
                        );
                      },
                      itemBuilder: (context, item, index) {
                        return InkWell(
                          onTap: () {
                            if (controller.categoryGiftLists[index]
                                        .split(' ')
                                        .first ==
                                    "Std" ||
                                controller.categoryGiftLists[index]
                                        .split(' ')
                                        .first ==
                                    "College") {
                              RouteManagement.goToQualifyPrizeScreen(
                                  item.education?.id ?? "",
                                  item.education?.gujaratiName ?? "");
                            } else {
                              RouteManagement.goToQualifyPrizeScreen(
                                  item.education?.id ?? "",
                                  item.education?.gujaratiName ?? "");
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.education?.gujaratiName ?? "",
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
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
