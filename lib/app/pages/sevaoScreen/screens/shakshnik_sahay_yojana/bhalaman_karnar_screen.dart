import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BhalamanKarnarScreen extends StatelessWidget {
  const BhalamanKarnarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) {
        var controller = Get.find<SevaoController>();
        controller.getCommitteemembers();
        controller.getVillageReMembersApi();
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
          centerTitle: false,
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
            "details_of_recommending_member".tr,
            style: Styles.mainGuj90020,
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
                    controller.addScolarship();
                  },
                  text: 'confrim'.tr,
                  backGroundColor: ColorsValue.maincolor,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: Dimens.edgeInsets20_30_20_0,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'name_of_executive_member'.tr,
                    style: Styles.grey9BA0A8Guj90016,
                  ),
                ),
                Container(
                  height: Dimens.fifty,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.six),
                    color: ColorsValue.greyEEEEEE,
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    hint: Text(
                      'choose_your_education'.tr,
                      style: Styles.grey9BA0A8Guj90016,
                    ),
                    padding: EdgeInsets.only(
                      left: Dimens.ten,
                      right: Dimens.ten,
                    ),
                    isExpanded: true,
                    icon: SvgPicture.asset(
                      AssetConstants.ic_down_arrow,
                    ),
                    value: controller.selectCommitteMembersValue,
                    items: controller.selectCommitteMembersLists
                        .map((value) => DropdownMenuItem(
                              value: value.id,
                              child: Text(
                                "${value.user?.name} ${value.user?.fathername ?? ""} ${value.user?.surname ?? ""}",
                              ),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      controller.selectCommitteMembersValue = newValue;
                      controller.update();
                    },
                  ),
                ),
                Dimens.boxHeight20,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'name_of_village_representative'.tr,
                    style: Styles.grey9BA0A8Guj90016,
                  ),
                ),
                Container(
                  height: Dimens.fifty,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.six),
                    color: ColorsValue.greyEEEEEE,
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    hint: Text(
                      'choose_your_education'.tr,
                      style: Styles.grey9BA0A8Guj90016,
                    ),
                    padding: EdgeInsets.only(
                      left: Dimens.ten,
                      right: Dimens.ten,
                    ),
                    isExpanded: true,
                    icon: SvgPicture.asset(
                      AssetConstants.ic_down_arrow,
                    ),
                    value: controller.selectVillageMembersValue,
                    items: controller.selectVillageMembersLists
                        .map((value) => DropdownMenuItem(
                              value: value.id,
                              child: Text(
                                "${value.user?.name} ${value.user?.fathername ?? ""} ${value.user?.surname ?? ""}",
                              ),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      controller.selectVillageMembersValue = newValue;
                      controller.update();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
