import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VideshSabhayVigatListScreen extends StatelessWidget {
  const VideshSabhayVigatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideshSabhayVigatController>(
      initState: (state) {
        var controller = Get.find<VideshSabhayVigatController>();
        controller.getAllForeigners();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.white,
          appBar: AppBar(
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
              'videsh_vasta_sabhay'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets20_00_20_20,
            child: CustomButton(
              onPressed: () {},
              text: 'save'.tr,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              RouteManagement.goToVideshSabhayVigatScreen("", false);
            },
            backgroundColor: ColorsValue.maincolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimens.hundred,
              ),
            ),
            child: Icon(
              Icons.add,
              size: Dimens.twentyFour,
              color: ColorsValue.white,
            ),
          ),
          body: controller.foreignersMembersList.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () {
                    Future.delayed(const Duration(seconds: 2));
                    return controller.getAllForeigners();
                  },
                  child: ListView.builder(
                    itemCount: controller.foreignersMembersList.length,
                    itemBuilder: (context, index) {
                      var item = controller.foreignersMembersList[index];
                      return Padding(
                        padding: Dimens.edgeInsets20_05_20_05,
                        child: Container(
                          padding: Dimens.edgeInsets20_15_20_15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.six,
                            ),
                            color: ColorsValue.white,
                            border: Border.all(
                              width: Dimens.one,
                              color: ColorsValue.maincolor,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${item.familymemberId?.name} ${item.familymemberId?.surname}",
                                style: Styles.blackGuj60018,
                              ),
                              Dimens.boxHeight12,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: Dimens.edgeInsets12_04_12_04,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.four,
                                      ),
                                      color: ColorsValue.lightMainColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        item.familymemberId?.relation ==
                                                "mother"
                                            ? "મા"
                                            : item.familymemberId?.relation ==
                                                    "father"
                                                ? "પિતા"
                                                : item.familymemberId
                                                            ?.relation ==
                                                        "wife"
                                                    ? "પત્ની"
                                                    : item.familymemberId
                                                                ?.relation ==
                                                            "sister"
                                                        ? "બહેન"
                                                        : item.familymemberId
                                                                    ?.relation ==
                                                                "brother"
                                                            ? "ભાઈ"
                                                            : item.familymemberId
                                                                        ?.relation ==
                                                                    "daughter"
                                                                ? "દીકરી"
                                                                : "દીકરો",
                                        style: Styles.mainGuj60016,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          RouteManagement
                                              .goToVideshSabhayVigatScreen(
                                                  item.id ?? "", true);
                                          controller.update();
                                        },
                                        child: SvgPicture.asset(
                                          AssetConstants.ic_edit,
                                        ),
                                      ),
                                      Dimens.boxWidth12,
                                      Container(
                                        width: Dimens.one,
                                        height: Dimens.twenty,
                                        color: ColorsValue.maincolor,
                                      ),
                                      Dimens.boxWidth12,
                                      InkWell(
                                        onTap: () {
                                          controller.postDeleteForeigner(
                                              item.id ?? "");
                                          controller.foreignersMembersList
                                              .removeAt(index);
                                          controller.update();
                                        },
                                        child: SvgPicture.asset(
                                          AssetConstants.ic_delete_item,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                    "Data not found...!",
                    style: Styles.main60018,
                  ),
                ),
        );
      },
    );
  }
}
