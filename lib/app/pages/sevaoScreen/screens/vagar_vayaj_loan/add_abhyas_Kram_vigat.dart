import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AbhyasKramNiVigatScreen extends StatelessWidget {
  const AbhyasKramNiVigatScreen({super.key});

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
            'course_details'.tr,
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
                    if (controller.selectCategories?.isEmpty ?? false) {
                      Utility.errorMessage("મેળવેલ પ્રવેશની કેટેગરી પસંદ કરો.");
                    } else if (controller.abhayasKarmKey.currentState!
                        .validate()) {
                      RouteManagement.goTokharchNiVigatScreen();
                    }
                  },
                  text: 'move_on'.tr,
                  backGroundColor: ColorsValue.maincolor,
                ),
              ),
            ],
          ),
        ),
        body: Form(
          key: controller.abhayasKarmKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: Dimens.edgeInsets20_30_20_0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller.courseNameController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'course_name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    validation: (p0) {
                      if (p0!.isEmpty) {
                        return 'અભ્યાસક્રમનું નામ દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    controller: controller.dgreeNameController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'degree_name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    validation: (p0) {
                      if (p0!.isEmpty) {
                        return 'આખરે મેળવવાની ડિગ્રીનું નામ દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    controller: controller.courseYearController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'course_year'.tr,
                    keybordtype: TextInputType.number,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    validation: (p0) {
                      if (p0!.isEmpty) {
                        return 'અભ્યાસક્રમ કેટલા વર્ષનો છે દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    controller: controller.courseBranchNameController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'course_branch_name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    validation: (p0) {
                      if (p0!.isEmpty) {
                        return 'જે સંસ્થામાં અભ્યાસ કરવાના હોય તેનું નામ દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    controller: controller.courseBranchAddressController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'course_branch_address'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    validation: (p0) {
                      if (p0!.isEmpty) {
                        return 'જે સંસ્થામાં અભ્યાસ કરવાના હોય તેનું સરનામું દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'category_admission'.tr,
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
                        'category_admission'.tr,
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
                      value: controller.selectCategories,
                      items: controller.selectCategoriesList
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value ?? ""),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        controller.selectCategories = newValue;
                        controller.update();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
