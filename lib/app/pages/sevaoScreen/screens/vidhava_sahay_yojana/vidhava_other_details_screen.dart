import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VidhavaOtherDetailsScreen extends StatelessWidget {
  const VidhavaOtherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
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
            'other_vigat'.tr,
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
                    controller.postWindowService();
                  },
                  text: 'confrim'.tr,
                  backGroundColor: ColorsValue.maincolor,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: Form(
          key: controller.abhayasKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: Dimens.edgeInsets20_30_20_0,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'pier_party_detail'.tr,
                  style: Styles.grey9BA0A8Guj90016,
                ),
              ),
              Container(
                padding: Dimens.edgeInsets10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.six),
                  color: ColorsValue.greyEEEEEE,
                ),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: controller.otherFatherNameController,
                      text: 'fatherName'.tr,
                      isGujarati: true,
                      fillColor: ColorsValue.white,
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.otherVillageController,
                      text: 'villageName'.tr,
                      isGujarati: true,
                      fillColor: ColorsValue.white,
                    ),
                  ],
                ),
              ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'need_help'.tr,
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
                    'need_help'.tr,
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
                  value: controller.selectNeedHelp ?? "",
                  items: controller.selectNeedHelpList
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value ?? "",
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    controller.selectNeedHelp = newValue;
                    controller.update();
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
