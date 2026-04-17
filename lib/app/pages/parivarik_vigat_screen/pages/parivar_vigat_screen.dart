import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ParivarikVigatScreen extends StatelessWidget {
  const ParivarikVigatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParivarikVigatController>(initState: (state) {
      var controller = Get.find<ParivarikVigatController>();
      controller.getStudies();
      controller.businessCategoriesApi();
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.white,
        appBar: AppBar(
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
            'parivar_vigat'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Form(
          key: controller.parivarikKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets20_00_20_00,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: ColorsValue.white,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(Dimens.thirty),
                                      topRight: Radius.circular(
                                        Dimens.thirty,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: Dimens.edgeInsets20,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                                if (await controller
                                                    .imagePermissionCheack(
                                                        context)) {
                                                  controller.setProfilePic(
                                                      ImageSource.camera);
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: Dimens.sixty,
                                                    width: Dimens.sixty,
                                                    padding:
                                                        Dimens.edgeInsets10,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimens.hundred,
                                                      ),
                                                      color: ColorsValue
                                                          .lightMainColor,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      AssetConstants.ic_camera,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        ColorsValue.maincolor,
                                                        BlendMode.srcIn,
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxHeight8,
                                                  Text(
                                                    'camera'.tr,
                                                    style: Styles.mainGuj60016,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Dimens.boxWidth60,
                                            InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                                if (await controller
                                                    .imagePermissionCheack(
                                                        context)) {
                                                  controller.setProfilePic(
                                                    ImageSource.gallery,
                                                  );
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: Dimens.sixty,
                                                    width: Dimens.sixty,
                                                    padding:
                                                        Dimens.edgeInsets10,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimens.hundred,
                                                      ),
                                                      color: ColorsValue
                                                          .lightMainColor,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      AssetConstants.ic_gallery,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        ColorsValue.maincolor,
                                                        BlendMode.srcIn,
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxHeight8,
                                                  Text(
                                                    'gallery'.tr,
                                                    style: Styles.mainGuj60016,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Dimens.hundredTwenty,
                        width: Dimens.hundredTwenty,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.thirty,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: ApiWrapper.imageUrl +
                                    (controller.profilePic ?? ""),
                                height: Dimens.hundredTwenty,
                                width: Dimens.hundredTwenty,
                                fit: BoxFit.cover,
                                maxHeightDiskCache: 300,
                                maxWidthDiskCache: 300,
                                placeholder: (context, index) {
                                  return Image.asset(
                                    AssetConstants.usera,
                                    height: Dimens.fourHundred,
                                    fit: BoxFit.cover,
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return Image.asset(
                                    AssetConstants.usera,
                                    height: Dimens.fourHundred,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: Dimens.twentyEight,
                                width: Dimens.twentyEight,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.hundred),
                                  color: ColorsValue.greyE8EEEF,
                                ),
                                child: Padding(
                                  padding: Dimens.edgeInsets8,
                                  child: SvgPicture.asset(
                                    AssetConstants.ic_camera,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'surname'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.surnameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'enter_surname'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.nameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'enter_name'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'father_name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.fatherNameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'enter_father_name'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'dob'.tr,
                    readOnly: true,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.dobController,
                    // validation: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'enter_dob'.tr;
                    //   }
                    //   return null;
                    // },
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
                          lastDate: DateTime(2100),
                        );
                        if (picked != null &&
                            picked != controller.selectedDate) {
                          controller.selectedDate = picked;
                          controller.dobController.text =
                              DateFormat("dd-MM-yyyy")
                                  .format(controller.selectedDate);
                          controller.selectDobDate =
                              Utility.dateYYYYMMDD(picked);
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
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'email'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.emailAddress,
                    controller: controller.emailController,
                    // validation: (value) {
                    //   if ((value?.isNotEmpty ?? false) &&
                    //       !Utility.emailValidator(value!)) {
                    //     return 'enter_valid_email'.tr;
                    //   }
                    //   return null;
                    // },
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
                      value: controller.selectBooldGroup,
                      items: controller.booldGroupLists.isNotEmpty
                          ? controller.booldGroupLists
                              .map((value) => DropdownMenuItem(
                                    value: value.isEmpty ? "A+" : value,
                                    child: Text(value.isEmpty ? "A+" : value),
                                  ))
                              .toList()
                          : [],
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
                      items: controller.selectEducationLists.isNotEmpty
                          ? controller.selectEducationLists
                              .map((value) => DropdownMenuItem(
                                    value: value.id,
                                    child: Text(value.gujaratiName ?? ""),
                                  ))
                              .toList()
                          : [],
                      onChanged: (newValue) {
                        controller.selectEducationValue = newValue;
                        controller.update();
                      },
                    ),
                  ),
                  if (controller.selectEducationValue == "other") ...[
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
                    // validation: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'enter_school_name'.tr;
                    //   }
                    //   return null;
                    // },
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
                      'optional_mobile_num'.tr,
                      style: Styles.grey9BA0A8Guj90016,
                    ),
                  ),
                  CustomInternationalPhoneFild(
                    textEditingController: controller.mobileOtherController,
                    text: ''.tr,
                    initialvalue: PhoneNumber(
                      isoCode: PhoneNumber.getISO2CodeByPrefix(
                        controller.dailCodeOptional.isNotEmpty
                            ? controller.dailCodeOptional
                            : "+91",
                      ),
                    ),
                    onInputChanged: (PhoneNumber number) {
                      controller.dailCodeOptional = number.dialCode ?? '';
                    },
                    oninitialValidation: (bool value) {
                      controller.isValidOptional = value;
                      controller.update();
                    },
                    validation: (value) {
                      if (!controller.isValidOptional) {
                        return "enter_valid_optional_mobile_num".tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'residential_address'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.addressController,
                    maxLines: 3,
                    // validation: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'enter_residential_address'.tr;
                    //   }
                    //   return null;
                    // },
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
                      items: controller.selectBusinessLists.isNotEmpty
                          ? controller.selectBusinessLists
                              .map((value) => DropdownMenuItem(
                                    value: value.id,
                                    child: Text(value.gujaratiName ?? ''),
                                  ))
                              .toList()
                          : [],
                      onChanged: (newValue) {
                        controller.selectBusinessValue = newValue;
                        controller.update();
                      },
                    ),
                  ),
                  if (controller.selectBusinessValue == "other") ...[
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'other_business_name'.tr,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                      keybordtype: TextInputType.emailAddress,
                      controller: controller.otherBusinessController,
                      // validation: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'અન્ય વ્યવસાયનું નામ દાખલ કરો'.tr;
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'farm_name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.emailAddress,
                    controller: controller.farmController,
                    // validation: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'enter_farm_name'.tr;
                    //   }
                    //   return null;
                    // },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'business_address'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.emailAddress,
                    controller: controller.businessAddresController,
                    // validation: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'enter_business_address'.tr;
                    //   }
                    //   return null;
                    // },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'business_address_details'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.emailAddress,
                    controller: controller.businessDetailsController,
                    // validation: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'enter_business_address_details'.tr;
                    //   }
                    //   return null;
                    // },
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
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'beginning_married_life'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.emailAddress,
                    controller: controller.marriedDatesController,
                    // validation: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'enter_beginning_married_life'.tr;
                    //   }
                    //   return null;
                    // },
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
                          initialDate: controller.selectedMarriedDate,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null &&
                            picked != controller.selectedMarriedDate) {
                          controller.selectedMarriedDate = picked;
                          controller.marriedDatesController.text =
                              DateFormat("dd-MM-yyyy")
                                  .format(controller.selectedMarriedDate);
                          controller.selectDomDate =
                              DateFormat("yyyy-MM-dd").format(picked);
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
                  // Dimens.boxHeight20,
                  // CustomTextFormField(
                  //   fillColor: ColorsValue.greyEEEEEE,
                  //   text: 'father_law_surname'.tr,
                  //   isGujarati: true,
                  //   textInputAction: TextInputAction.next,
                  //   keybordtype: TextInputType.emailAddress,
                  //   controller: controller.fatherLawSurnameController,
                  //   // validation: (value) {
                  //   //   if (value!.isEmpty) {
                  //   //     return 'enter_father_law_surname'.tr;
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),
                  // Dimens.boxHeight20,
                  // CustomTextFormField(
                  //   fillColor: ColorsValue.greyEEEEEE,
                  //   text: 'father_law_name'.tr,
                  //   isGujarati: true,
                  //   textInputAction: TextInputAction.next,
                  //   keybordtype: TextInputType.emailAddress,
                  //   controller: controller.fatherLawNameController,
                  //   // validation: (value) {
                  //   //   if (value!.isEmpty) {
                  //   //     return 'enter_father_law_name'.tr;
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),
                  // Dimens.boxHeight20,
                  // CustomTextFormField(
                  //   fillColor: ColorsValue.greyEEEEEE,
                  //   text: 'father_law_father_name'.tr,
                  //   isGujarati: true,
                  //   textInputAction: TextInputAction.next,
                  //   keybordtype: TextInputType.emailAddress,
                  //   controller: controller.fatherLawFatherNameController,
                  //   // validation: (value) {
                  //   //   if (value!.isEmpty) {
                  //   //     return 'enter_father_law_father_name'.tr;
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),
                  // Dimens.boxHeight20,
                  // CustomTextFormField(
                  //   fillColor: ColorsValue.greyEEEEEE,
                  //   text: 'father_law_village'.tr,
                  //   isGujarati: true,
                  //   textInputAction: TextInputAction.next,
                  //   keybordtype: TextInputType.emailAddress,
                  //   controller: controller.fatherLawVillageNameController,
                  //   // validation: (value) {
                  //   //   if (value!.isEmpty) {
                  //   //     return 'enter_father_law_village'.tr;
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),
                  // Dimens.boxHeight20,
                  // CustomTextFormField(
                  //   fillColor: ColorsValue.greyEEEEEE,
                  //   text: 'father_law_taluka'.tr,
                  //   isGujarati: true,
                  //   textInputAction: TextInputAction.next,
                  //   keybordtype: TextInputType.emailAddress,
                  //   controller: controller.fatherLawTalukaController,
                  //   // validation: (value) {
                  //   //   if (value!.isEmpty) {
                  //   //     return 'enter_father_law_taluka'.tr;
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),
                  // Dimens.boxHeight20,
                  // CustomTextFormField(
                  //   fillColor: ColorsValue.greyEEEEEE,
                  //   text: 'father_law_district'.tr,
                  //   isGujarati: true,
                  //   textInputAction: TextInputAction.next,
                  //   keybordtype: TextInputType.emailAddress,
                  //   controller: controller.fatherLawDistrictController,
                  //   // validation: (value) {
                  //   //   if (value!.isEmpty) {
                  //   //     return 'enter_father_law_district'.tr;
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),
                  // Dimens.boxHeight20,
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'upload_adhar'.tr,
                  //     style: Styles.grey9BA0A8Guj90016,
                  //   ),
                  // ),
                  // Card(
                  //   elevation: 2,
                  //   color: ColorsValue.white,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       UploadWidgets(
                  //         height: Dimens.fourtyFive,
                  //         txt: 'add_photo'.tr,
                  //         onTap: () {
                  //           // controller.selectImagesBrochure();
                  //         },
                  //         bgColor: ColorsValue.white,
                  //         svgPicture: AssetConstants.ic_photo,
                  //       ),
                  //       !controller.categoryLists.isEmpty
                  //           ? Padding(
                  //               padding: Dimens.edgeInsets10,
                  //               child: GridView.builder(
                  //                   physics: const ScrollPhysics(),
                  //                   padding: Dimens.edgeInsets10,
                  //                   gridDelegate:
                  //                       const SliverGridDelegateWithFixedCrossAxisCount(
                  //                     mainAxisSpacing: 10,
                  //                     crossAxisSpacing: 10,
                  //                     crossAxisCount: 2,
                  //                   ),
                  //                   itemCount: 2,
                  //                   shrinkWrap: true,
                  //                   itemBuilder: (context, index) {
                  //                     return ClipRRect(
                  //                       borderRadius: BorderRadius.circular(
                  //                         Dimens.five,
                  //                       ),
                  //                       child: Stack(
                  //                         children: <Widget>[
                  //                           Center(
                  //                             child: GestureDetector(
                  //                               onTap: () {},
                  //                               child: CachedNetworkImage(
                  //                                 imageUrl: "",
                  //                                 height: Dimens.hundredEight,
                  //                                 width: Dimens.hundredEight,
                  //                                 fit: BoxFit.cover,
                  //                                 maxHeightDiskCache: 300,
                  //                                 maxWidthDiskCache: 300,
                  //                                 placeholder:
                  //                                     (context, index) {
                  //                                   return Image.asset(
                  //                                     AssetConstants.app_logo,
                  //                                     fit: BoxFit.cover,
                  //                                   );
                  //                                 },
                  //                                 errorWidget:
                  //                                     (context, url, error) {
                  //                                   return Image.asset(
                  //                                     AssetConstants.app_logo,
                  //                                     fit: BoxFit.cover,
                  //                                   );
                  //                                 },
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           Align(
                  //                             alignment: Alignment.topRight,
                  //                             child: InkWell(
                  //                               onTap: () {
                  //                                 // controller
                  //                                 //     .removeImagePlacePhoto(
                  //                                 //         index);
                  //                               },
                  //                               child: Padding(
                  //                                 padding: Dimens.edgeInsets5,
                  //                                 child: SvgPicture.asset(
                  //                                   AssetConstants.ic_delete,
                  //                                   colorFilter:
                  //                                       const ColorFilter.mode(
                  //                                     ColorsValue.redColor,
                  //                                     BlendMode.srcIn,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           )
                  //                         ],
                  //                       ),
                  //                     );
                  //                   }),
                  //             )
                  //           : Container()
                  //     ],
                  //   ),
                  // ),
                  Dimens.boxHeight30,
                  CustomButton(
                    onPressed: () {
                      if (controller.parivarikKey.currentState!.validate()) {
                        RouteManagement.goToOtherDetailsScreen();
                      }
                    },
                    text: 'next'.tr,
                  ),
                  Dimens.boxHeight20,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
