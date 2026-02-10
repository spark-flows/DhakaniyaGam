import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/routes_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BalkoNiVigatScreen extends StatelessWidget {
  const BalkoNiVigatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) async {
        var controller = Get.find<SevaoController>();
        controller.childList.clear();
        var personsList = controller.box.values.toList();
        controller.childList.addAll(personsList);
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
              Navigator.pop(context);},
            child: Padding(
              padding: Dimens.edgeInsets12,
              child: SvgPicture.asset(
                AssetConstants.ic_left_arrow,
              ),
            ),
          ),
          title: Text(
            'children_detail'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            RouteManagement.goToAddBalkoScreen(false, 0);
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
        bottomNavigationBar: Padding(
          padding: Dimens.edgeInsets20_10_20_30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: CustomButton(
                  onPressed: () {Navigator.pop(context);
                  },
                  text: 'go_back'.tr,
                  textStyle: Styles.mainGuj70018,
                  backGroundColor: ColorsValue.lightMainColor,
                ),
              ),
              Dimens.boxWidth20,
              Expanded(
                flex: 2,
                child: CustomButton(
                  onPressed: () {
                    RouteManagement.goToVidhavaOtherDetailsScreen();
                  },
                  text: 'move_on'.tr,
                  backGroundColor: ColorsValue.maincolor,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: Dimens.edgeInsets20_30_20_0,
            child: controller.childList.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.childList.length,
                    itemBuilder: (context, index) {
                      var item = controller.childList[index];
                      return Padding(
                        padding: Dimens.edgeInsetsBottom20,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorsValue.maincolor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimens.six),
                            ),
                          ),
                          child: Padding(
                            padding: Dimens.edgeInsets20_15_20_15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.fullname ?? "",
                                  style: Styles.blackGuj60018,
                                ),
                                Dimens.boxHeight12,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorsValue.lightMainColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(Dimens.six))),
                                      child: Padding(
                                          padding: Dimens.edgeInsets12_6_12_6,
                                          child: Text(
                                            item.relation == "daughter"
                                                ? 'દીકરી'
                                                : "દીકરો",
                                            style: Styles.mainGuj60016,
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.selectAddChildValue =
                                                item.familymember;
                                            controller.dobController.text =
                                                item.dob ?? "";
                                            controller
                                                    .selectChildEducationValue =
                                                item.education;
                                            controller.feeDeatilController
                                                .text = item.fees.toString();
                                            controller.feePic = item.feeReceipt;
                                            controller.selectBusinessValue =
                                                item.business;
                                            controller
                                                .otherChildBusinessController
                                                .text = item
                                                    .otherBusiness ??
                                                "";
                                            controller.ageBalkoController.text =
                                                controller
                                                    .calculateAge(item.dob);
                                            controller.update();
                                            RouteManagement.goToAddBalkoScreen(
                                                true, index);
                                          },
                                          child: SvgPicture.asset(
                                            AssetConstants.ic_edit,
                                            colorFilter: ColorFilter.mode(
                                                ColorsValue.maincolor,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                        const VerticalDivider(
                                          thickness: 2,
                                          color: ColorsValue.redColor,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            // await controller.box.delete(index);
                                            controller.childList
                                                .removeAt(index);
                                            controller.update();
                                          },
                                          child: SvgPicture.asset(
                                            AssetConstants.ic_delete,
                                            colorFilter: const ColorFilter.mode(
                                              ColorsValue.redColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Data Not Found...!",
                      style: Styles.black2E363F50018,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
