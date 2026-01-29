import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VidhvaSahayYojna extends StatelessWidget {
  const VidhvaSahayYojna({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) {
        var controller = Get.find<SevaoController>();
        controller.getWindowService();
      },
      builder: (controller) => Scaffold(
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
            'window_yojana'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            RouteManagement.goToVidhvaBenniVigatScreen();
          },
          backgroundColor: ColorsValue.maincolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimens.hundred,
            ),
          ),
          child: const Icon(
            Icons.add,
            color: ColorsValue.white,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: Dimens.edgeInsets20,
            child: ListView.builder(
              itemCount: controller.appliedWindowList.length,
              itemBuilder: (context, index) {
                var item = controller.appliedWindowList[index];
                return Padding(
                  padding: Dimens.edgeInsetsTopt10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsValue.maincolor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Dimens.six,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: Dimens.edgeInsets20_12_20_12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${item.familymember?.name} ${item.familymember?.fathername} ${item.familymember?.surname}",
                                style: Styles.blackGuj60018,
                              ),
                              Text(
                                item.action == "approved"
                                    ? "સ્વીકાર્ય"
                                    : item.action == "rejected"
                                        ? "રિજેક્ટ"
                                        : "પેન્ડિંગ",
                                style: item.action == "approved"
                                    ? Styles.greenGuj60012
                                    : item.action == "rejected"
                                        ? Styles.redGuj60012
                                        : Styles.orangeGuj60012,
                              ),
                            ],
                          ),
                          Dimens.boxHeight12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorsValue.lightMainColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        Dimens.four,
                                      ),
                                    )),
                                child: Padding(
                                  padding: Dimens.edgeInsets12_6_12_6,
                                  child: Text(
                                    "-",
                                    style: Styles.mainGuj60016,
                                  ),
                                ),
                              ),
                              Text(
                                Utility.getTimeStempToDate(
                                    item.createTimestamp),
                                style: Styles.grey9393Guj60012,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
