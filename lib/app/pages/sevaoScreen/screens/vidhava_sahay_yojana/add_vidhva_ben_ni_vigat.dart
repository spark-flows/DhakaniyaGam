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

class VidhvaBenNiVigatScreen extends StatelessWidget {
  const VidhvaBenNiVigatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) {
        var controller = Get.find<SevaoController>();
        controller.getWindow();
        controller.getWindowStudies();
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
            'vidhava_details'.tr,
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
                    Navigator.pop(context);
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
                    RouteManagement.goToBalkoniVigatScreen();
                  },
                  text: 'move_on'.tr,
                  backGroundColor: ColorsValue.maincolor,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: Dimens.edgeInsets20_30_20_0,
            children: [
              InkWell(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);
                                          if (await Utility
                                              .imagePermissionCheack(context)) {
                                            controller.uploadProfilePic(
                                                ImageSource.camera);
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: Dimens.sixty,
                                              width: Dimens.sixty,
                                              padding: Dimens.edgeInsets10,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.hundred,
                                                ),
                                                color:
                                                    ColorsValue.lightMainColor,
                                              ),
                                              child: SvgPicture.asset(
                                                AssetConstants.ic_camera,
                                                colorFilter: ColorFilter.mode(
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
                                          if (await Utility
                                              .imagePermissionCheack(context)) {
                                            controller.uploadProfilePic(
                                              ImageSource.gallery,
                                            );
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: Dimens.sixty,
                                              width: Dimens.sixty,
                                              padding: Dimens.edgeInsets10,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.hundred,
                                                ),
                                                color:
                                                    ColorsValue.lightMainColor,
                                              ),
                                              child: SvgPicture.asset(
                                                AssetConstants.ic_gallery,
                                                colorFilter: ColorFilter.mode(
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
                            borderRadius: BorderRadius.circular(Dimens.hundred),
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
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'vidhava_name'.tr,
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
                    'sabhyName'.tr,
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
                  value: controller.selectWindowValue,
                  items: controller.selectWindowLists
                      .map((value) => DropdownMenuItem(
                            value: value.id,
                            child: Text(
                                "${value.name ?? "Select Member"} ${value.fathername ?? ""} ${value.surname ?? ""}"),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    controller.selectWindowValue = newValue;
                    controller.update();
                  },
                ),
              ),
              Dimens.boxHeight20,
              CustomTextFormField(
                fillColor: ColorsValue.greyEEEEEE,
                text: 'dob'.tr,
                readOnly: true,
                isGujarati: true,
                textInputAction: TextInputAction.next,
                controller: controller.dobWindowController,
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
                      initialDate: controller.selectedWindowDate,
                      firstDate: DateTime(1920),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null &&
                        picked != controller.selectedWindowDate) {
                      controller.selectedWindowDate = picked;
                      controller.dobWindowController.text =
                          DateFormat("dd MMM yyyy")
                              .format(controller.selectedWindowDate);
                      controller.ageController.text = controller
                          .calculateAge(controller.dobWindowController.text);
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
                controller: controller.ageController,
                text: 'age'.tr,
                isGujarati: true,
                readOnly: true,
                fillColor: ColorsValue.greyEEEEEE,
              ),
              Dimens.boxHeight20,
              CustomTextFormField(
                controller: controller.educationWindowController,
                fillColor: ColorsValue.greyEEEEEE,
                text: 'enter_education'.tr,
                isGujarati: true,
                textInputAction: TextInputAction.next,
                validation: (p0) {
                  if (p0!.isEmpty) {
                    return 'enter_education'.tr;
                  }
                  return null;
                },
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     'Study'.tr,
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
              //       'sabhyName'.tr,
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
              //     value: controller.selectWindowEducationValue,
              //     items: controller.selectWindowEducationLists
              //         .map((value) => DropdownMenuItem(
              //               value: value.id,
              //               child: Text(value.gujaratiName ?? ""),
              //             ))
              //         .toList(),
              //     onChanged: (newValue) {
              //       controller.selectWindowEducationValue = newValue;
              //       controller.update();
              //     },
              //   ),
              // ),
              // if (controller.selectWindowEducationValue == "") ...[
              //   Dimens.boxHeight20,
              //   CustomTextFormField(
              //     controller: controller.otherEducationController,
              //     text: 'other_education_name'.tr,
              //     isGujarati: true,
              //     fillColor: ColorsValue.greyEEEEEE,
              //   ),
              // ],
              Dimens.boxHeight20,
              CustomTextFormField(
                controller: controller.dodWindowController,
                text: 'husband_death_year'.tr,
                isGujarati: true,
                fillColor: ColorsValue.greyEEEEEE,
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
                      initialDate: controller.selectedDodWindowDate,
                      firstDate: DateTime(1920),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null &&
                        picked != controller.selectedDodWindowDate) {
                      controller.selectedDodWindowDate = picked;
                      controller.dodWindowController.text =
                          DateFormat("dd MMM yyyy")
                              .format(controller.selectedDodWindowDate);
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
                  'mobile_number'.tr,
                  style: Styles.grey9BA0A8Guj90016,
                ),
              ),
              CustomInternationalPhoneFild(
                text: ''.tr,
                initialvalue: PhoneNumber(
                  isoCode: PhoneNumber.getISO2CodeByPrefix(
                    controller.dailWindow,
                  ),
                ),
                onInputChanged: (PhoneNumber number) {
                  controller.dailWindow = number.dialCode ?? '';
                },
                oninitialValidation: (bool value) {
                  controller.isWindowValid = value;
                  controller.update();
                },
                textEditingController: controller.mobileWindowController,
                validation: (value) {
                  if (value!.isEmpty) {
                    return "enter_mobile_number".tr;
                  } else if (!controller.isWindowValid) {
                    return "enter_valid_mobile_number".tr;
                  }
                  return null;
                },
              ),
              Dimens.boxHeight20,
              CustomTextFormField(
                controller: controller.addressWindowController,
                text: 'residential_address'.tr,
                fillColor: ColorsValue.greyEEEEEE,
                maxLines: 4,
              ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'home'.tr,
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
                    'MakanBhadanu'.tr,
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
                  value: controller.selectHouse,
                  items: controller.houseList
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              value ?? "",
                            ),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    controller.selectHouse = newValue;
                    controller.update();
                  },
                ),
              ),
              Dimens.boxHeight20,
              CustomTextFormField(
                controller: controller.homeSituationController,
                text: 'home_situation'.tr,
                fillColor: ColorsValue.greyEEEEEE,
              ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'current_situation'.tr,
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
                    'MakanBhadanu'.tr,
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
                  value: controller.selectCurrentSituation,
                  items: controller.currentSituationList
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value ?? ""),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    controller.selectCurrentSituation = newValue;
                    controller.update();
                  },
                ),
              ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'death_certificate'.tr,
                  style: Styles.grey9BA0A8Guj90016,
                ),
              ),
              Card(
                elevation: 2,
                color: ColorsValue.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UploadWidgets(
                      height: Dimens.fourtyFive,
                      txt: 'death_certificate'.tr,
                      onTap: () {
                        controller.uploadDeathCertificate(ImageSource.gallery);
                      },
                      bgColor: ColorsValue.white,
                      svgPicture: AssetConstants.ic_photo,
                    ),
                    Visibility(
                      visible: controller.certificatePic?.isNotEmpty ?? false,
                      child: CachedNetworkImage(
                        imageUrl: ApiWrapper.imageUrl +
                            (controller.certificatePic ?? ""),
                        height: Dimens.twoHundred,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        maxHeightDiskCache: 300,
                        maxWidthDiskCache: 300,
                        placeholder: (context, index) {
                          return Image.asset(
                            AssetConstants.app_logo,
                            fit: BoxFit.cover,
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Image.asset(
                            AssetConstants.app_logo,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Dimens.boxHeight30,
            ],
          ),
        ),
      ),
    );
  }
}
