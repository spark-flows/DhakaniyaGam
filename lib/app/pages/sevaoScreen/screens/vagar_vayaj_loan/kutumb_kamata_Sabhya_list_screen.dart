import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class KutumbKamataSabhyListScreen extends StatelessWidget {
  const KutumbKamataSabhyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) async {
        var controller = Get.find<SevaoController>();
        controller.getKutumbFamily();
        controller.fetchNotes();
      },
      builder: (controller) {
        return Scaffold(
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
              'family_earning_detail'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              RouteManagement.goToAddkamataSabhyScreen(false, 0);
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
                    onPressed: () {
                      Get.back();
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
                      RouteManagement.goToKhetiNiVigatScreen();
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
            child: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                var item = controller.list[index];
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
                            item.fullName ?? "",
                            style: Styles.blackGuj60018,
                          ),
                          Dimens.boxHeight12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorsValue.lightMainColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Dimens.six))),
                                child: Padding(
                                  padding: Dimens.edgeInsets12_6_12_6,
                                  child: Text(
                                    item.relation ?? "",
                                    style: Styles.mainGuj60016,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.selectedId = item.id;
                                      controller.selectKutumbValue = item.name;
                                      controller.businessLoanController.text =
                                          item.businessName??"";
                                     
                                      controller.dobFamilyController.text =
                                          item.dob ?? "";
                                      controller.ageFamilyController.text =
                                          item.age ?? "";
                                      controller.enualIncomeController.text =
                                          item.total_income ?? "";

                                      controller.update();
                                      RouteManagement.goToAddkamataSabhyScreen(
                                          true, index);
                                    },
                                    child: SvgPicture.asset(
                                      AssetConstants.ic_edit,
                                      colorFilter: ColorFilter.mode(
                                        ColorsValue.maincolor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    thickness: 2,
                                    color: ColorsValue.redColor,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.deleteNote(item.id!);
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
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
        );
      },
    );
  }
}
