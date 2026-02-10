import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class VideshSabhayVigatScreen extends StatelessWidget {
  const VideshSabhayVigatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideshSabhayVigatController>(
      initState: (state) {
        var controller = Get.find<VideshSabhayVigatController>();
        controller.isEdit = Get.arguments[1] ?? false;
        if (controller.isEdit ?? false) {
          controller.getOneForeigners(Get.arguments[0] ?? "");
        } else {
          controller.mobileController.clear();
          controller.otherEducationController.clear();
          controller.universityController.clear();
          controller.otherBusinessController.clear();
          controller.videshNameController.clear();
          controller.cityController.clear();
          controller.whereFormController.clear();
        }
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.white,
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
              'add_videsh_member'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          body: Form(
            key: controller.videshkKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: Dimens.edgeInsets20,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'select_member'.tr,
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
                          'select_member'.tr,
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
                        value: controller.selectFullFamilyValue,
                        items: controller.selectFullFamilyLists
                            .map((value) => DropdownMenuItem(
                                  value: value.id,
                                  child: Text(
                                      "${value.name ?? "Select Member"} ${value.fathername ?? ""} ${value.surname ?? ""}"),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          controller.selectFullFamilyValue = newValue;
                          controller.update();
                        },
                      ),
                    ),
                    Dimens.boxHeight20,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'mobile_number'.tr,
                        style: Styles.grey9BA0A8Guj90016,
                      ),
                    ),
                    CustomInternationalPhoneFild(
                      text: ''.tr,
                      initialvalue: PhoneNumber(
                        isoCode: PhoneNumber.getISO2CodeByPrefix(
                          controller.dailcode,
                        ),
                      ),
                      onInputChanged: (PhoneNumber number) {
                        controller.dailcode = number.dialCode ?? '';
                      },
                      oninitialValidation: (bool value) {
                        controller.isValid = value;
                        controller.update();
                      },
                      textEditingController: controller.mobileController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return "enter_mobile_number".tr;
                        } else if (!controller.isValid) {
                          return "enter_valid_mobile_number".tr;
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'videsh_status'.tr,
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
                          'videsh_status'.tr,
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
                        value: controller.selectValue,
                        items: controller.categoryLists
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          controller.selectValue = newValue;
                          controller.update();
                        },
                      ),
                    ),
                    Dimens.boxHeight20,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Study'.tr,
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
                          'Study'.tr,
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
                        value: controller.selectEducationValue,
                        items: controller.selectEducationLists
                            .map((value) => DropdownMenuItem(
                                  value: value.id,
                                  child: Text(value.gujaratiName ?? ""),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          controller.selectEducationValue = newValue;
                          controller.update();
                        },
                      ),
                    ),
                    if (controller.selectEducationValue!.isEmpty) ...[
                      Dimens.boxHeight20,
                      CustomTextFormField(
                        fillColor: ColorsValue.greyEEEEEE,
                        text: 'other_education_name'.tr,
                        isGujarati: true,
                        textInputAction: TextInputAction.next,
                        keybordtype: TextInputType.emailAddress,
                        controller: controller.otherEducationController,
                      ),
                    ],
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'university_name'.tr,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                      controller: controller.universityController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'enter_university_name'.tr;
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'business_name'.tr,
                        style: Styles.grey9BA0A8Guj90016,
                      ),
                    ),
                    Container(
                      height: Dimens.fifty,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.six),
                          color: ColorsValue.greyEEEEEE),
                      child: DropdownButton<String>(
                        underline: Container(),
                        hint: Text('business_name'.tr,
                            style: Styles.grey9BA0A8Guj90016),
                        padding: EdgeInsets.only(
                            left: Dimens.ten, right: Dimens.ten),
                        isExpanded: true,
                        icon: SvgPicture.asset(AssetConstants.ic_down_arrow),
                        value: controller.selectBusinessValue,
                        items: controller.selectBusinessLists
                            .map((value) => DropdownMenuItem(
                                  value: value.id,
                                  child: Text(value.gujaratiName ?? ''),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          controller.selectBusinessValue = newValue;
                          controller.update();
                        },
                      ),
                    ),
                    if (controller.selectBusinessValue!.isEmpty) ...[
                      Dimens.boxHeight20,
                      CustomTextFormField(
                        fillColor: ColorsValue.greyEEEEEE,
                        text: 'other_business_name'.tr,
                        isGujarati: true,
                        textInputAction: TextInputAction.next,
                        keybordtype: TextInputType.emailAddress,
                        controller: controller.otherBusinessController,
                      ),
                    ],
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'videsh_name'.tr,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                      controller: controller.videshNameController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'enter_videsh_name'.tr;
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'city_name'.tr,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                      controller: controller.cityController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'enter_city_name'.tr;
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'form_where'.tr,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                      controller: controller.whereFormController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'enter_form_where'.tr;
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    CustomButton(
                      onPressed: () {
                        if (controller.videshkKey.currentState!.validate()) {
                          if (controller.isEdit ?? false) {
                            controller.postForeignersSave(Get.arguments[0]);
                          } else {
                            controller.postForeignersSave("");
                          }
                        }
                      },
                      text: 'save'.tr,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
