import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ParivarSabhayVigatScreen extends StatelessWidget {
  const ParivarSabhayVigatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParivarSabhayVigatController>(initState: (state) {
      var controller = Get.find<ParivarSabhayVigatController>();
      controller.isEdit = Get.arguments[1] ?? false;
      if (controller.isEdit ?? false) {
        controller.getOneFamilyMembers(Get.arguments[0] ?? "");
      } else {
        controller.memberController.clear();
        controller.fatherNameController.clear();
        controller.mobileController.clear();
        controller.dobController.clear();
        controller.otherBusinessController.clear();
        controller.schoolNameController.clear();
        controller.otherEducationController.clear();
        controller.marriedDatesController.clear();
        controller.busineDetailController.clear();
      }
      controller.surnameController.text =
          Get.find<HomeController>().getProfileData?.surname ?? "";
    }, builder: (controller) {
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
            'add_member'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Form(
          key: controller.memberKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets20,
              child: Column(
                children: [
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: "અટક",
                    isGujarati: true,
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.surnameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'અટક દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'member_name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.memberController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'enter_member_name'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: "પિતાનું નામ",
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.fatherNameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "પિતાનું નામ દાખલ કરો";
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'relationship'.tr,
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
                        'relationship'.tr,
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
                      value: controller.selectRelationValue,
                      items: controller.relationLists
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        controller.selectRelationValue = newValue;
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
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'dob'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.dobController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'enter_dob'.tr;
                      }
                      return null;
                    },
                    suffixIcon: InkWell(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: ColorsValue.maincolor,
                                  onPrimary: ColorsValue.white,
                                  onSurface: ColorsValue.maincolor,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: ColorsValue.maincolor,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          context: context,
                          initialDate: controller.selectedDate,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(9000),
                        );
                        if (picked != null &&
                            picked != controller.selectedDate) {
                          controller.selectedDate = picked;
                          controller.dobController.text =
                              DateFormat("yyyy-MM-dd")
                                  .format(controller.selectedDate);
                          controller.update();
                        }
                      },
                      child: Padding(
                        padding: Dimens.edgeInsets10,
                        child: SvgPicture.asset(
                          AssetConstants.ic_calendar,
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'blood_group'.tr,
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
                        'blood_group'.tr,
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
                      value: controller.selectBooldGroup ?? "A+",
                      items: controller.booldGroupLists
                          .map((value) => DropdownMenuItem(
                                value: value.isEmpty ? "A+" : value,
                                child: Text(value.isEmpty ? "A+" : value),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        controller.selectBooldGroup = newValue;
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
                    text: 'school_name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.emailAddress,
                    controller: controller.schoolNameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'enter_school_name'.tr;
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
                      padding:
                          EdgeInsets.only(left: Dimens.ten, right: Dimens.ten),
                      isExpanded: true,
                      icon: SvgPicture.asset(AssetConstants.ic_down_arrow),
                      value: controller.selectBusinessValue,
                      items: controller.selectBusinessLists
                          .map(
                            (value) => DropdownMenuItem(
                              value: value.id,
                              child: Text(value.gujaratiName ?? ''),
                            ),
                          )
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
                    text: 'business_address_details'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.emailAddress,
                    controller: controller.busineDetailController,
                  ),
                  // Dimens.boxHeight20,
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'married_or_not'.tr,
                  //     style: Styles.grey9BA0A8Guj90016,
                  //   ),
                  // ),
                  // Container(
                  //   height: Dimens.fifty,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(Dimens.six),
                  //     color: ColorsValue.greyEEEEEE,
                  //   ),
                  //   child: DropdownButton<String>(
                  //     underline: Container(),
                  //     hint: Text(
                  //       'married_or_not'.tr,
                  //       style: Styles.grey9BA0A8Guj90016,
                  //     ),
                  //     padding: EdgeInsets.only(
                  //       left: Dimens.ten,
                  //       right: Dimens.ten,
                  //     ),
                  //     isExpanded: true,
                  //     icon: SvgPicture.asset(
                  //       AssetConstants.ic_down_arrow,
                  //     ),
                  //     value: controller.selectMarried,
                  //     items: controller.selectMarriedList
                  //         .map((value) => DropdownMenuItem(
                  //               value: value,
                  //               child: Text(value),
                  //             ))
                  //         .toList(),
                  //     onChanged: (newValue) {
                  //       controller.selectMarried = newValue;
                  //       controller.update();
                  //     },
                  //   ),
                  // ),
                  // Dimens.boxHeight20,
                  // CustomTextFormField(
                  //   fillColor: ColorsValue.greyEEEEEE,
                  //   text: 'beginning_married_life'.tr,
                  //   isGujarati: true,
                  //   textInputAction: TextInputAction.next,
                  //   keybordtype: TextInputType.emailAddress,
                  //   controller: controller.marriedDatesController,
                  //   validation: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'enter_beginning_married_life'.tr;
                  //     }
                  //     return null;
                  //   },
                  //   suffixIcon: InkWell(
                  //     onTap: () async {
                  //       final DateTime? picked = await showDatePicker(
                  //         builder: (context, child) {
                  //           return Theme(
                  //             data: Theme.of(context).copyWith(
                  //               colorScheme: ColorScheme.light(
                  //                 primary: ColorsValue.maincolor,
                  //                 onPrimary: ColorsValue.white,
                  //                 onSurface: ColorsValue.maincolor,
                  //               ),
                  //               textButtonTheme: TextButtonThemeData(
                  //                 style: TextButton.styleFrom(
                  //                   foregroundColor: ColorsValue.maincolor,
                  //                 ),
                  //               ),
                  //             ),
                  //             child: child!,
                  //           );
                  //         },
                  //         context: context,
                  //         initialDate: controller.selectedMarriedDate,
                  //         firstDate: DateTime(1920),
                  //         lastDate: DateTime(2100),
                  //       );
                  //       if (picked != null &&
                  //           picked != controller.selectedMarriedDate) {
                  //         controller.selectedMarriedDate = picked;
                  //         controller.marriedDatesController.text =
                  //             DateFormat("dd MMM yyyy")
                  //                 .format(controller.selectedMarriedDate);
                  //         controller.update();
                  //       }
                  //     },
                  //     child: Padding(
                  //       padding: Dimens.edgeInsets10,
                  //       child: SvgPicture.asset(
                  //         AssetConstants.ic_calendar,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Dimens.boxHeight20,
                  // if (controller.selectRelationValue == "મા" ||
                  //     controller.selectRelationValue == "પિતા" ||
                  //     controller.selectRelationValue == "પત્ની") ...[
                  //   CustomTextFormField(
                  //     fillColor: ColorsValue.greyEEEEEE,
                  //     text: 'father_law_surname'.tr,
                  //     isGujarati: true,
                  //     textInputAction: TextInputAction.next,
                  //     keybordtype: TextInputType.emailAddress,
                  //     controller: controller.fatherLawSurnameController,
                  //     validation: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'enter_father_law_surname'.tr;
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  //   Dimens.boxHeight20,
                  //   CustomTextFormField(
                  //     fillColor: ColorsValue.greyEEEEEE,
                  //     text: 'father_law_name'.tr,
                  //     isGujarati: true,
                  //     textInputAction: TextInputAction.next,
                  //     keybordtype: TextInputType.emailAddress,
                  //     controller: controller.fatherLawNameController,
                  //     validation: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'enter_father_law_name'.tr;
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  //   Dimens.boxHeight20,
                  //   CustomTextFormField(
                  //     fillColor: ColorsValue.greyEEEEEE,
                  //     text: 'father_law_father_name'.tr,
                  //     isGujarati: true,
                  //     textInputAction: TextInputAction.next,
                  //     keybordtype: TextInputType.emailAddress,
                  //     controller: controller.fatherLawFatherNameController,
                  //     validation: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'enter_father_law_father_name'.tr;
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  //   Dimens.boxHeight20,
                  //   CustomTextFormField(
                  //     fillColor: ColorsValue.greyEEEEEE,
                  //     text: 'father_law_village'.tr,
                  //     isGujarati: true,
                  //     textInputAction: TextInputAction.next,
                  //     keybordtype: TextInputType.emailAddress,
                  //     controller: controller.fatherLawVillageNameController,
                  //     validation: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'enter_father_law_village'.tr;
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  //   Dimens.boxHeight20,
                  //   CustomTextFormField(
                  //     fillColor: ColorsValue.greyEEEEEE,
                  //     text: 'father_law_taluka'.tr,
                  //     isGujarati: true,
                  //     textInputAction: TextInputAction.next,
                  //     keybordtype: TextInputType.emailAddress,
                  //     controller: controller.fatherLawTalukaController,
                  //     validation: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'enter_father_law_taluka'.tr;
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  //   Dimens.boxHeight20,
                  //   CustomTextFormField(
                  //     fillColor: ColorsValue.greyEEEEEE,
                  //     text: 'father_law_district'.tr,
                  //     isGujarati: true,
                  //     textInputAction: TextInputAction.next,
                  //     keybordtype: TextInputType.emailAddress,
                  //     controller: controller.fatherLawDistrictController,
                  //     validation: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'enter_father_law_district'.tr;
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ],
                  Dimens.boxHeight20,
                  CustomButton(
                    onPressed: () {
                      if (controller.isEdit ?? false) {
                        controller.postFamilyMembersAdd(Get.arguments[0]);
                      } else {
                        controller.postFamilyMembersAdd("");
                      }
                    },
                    text: 'submit'.tr,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
