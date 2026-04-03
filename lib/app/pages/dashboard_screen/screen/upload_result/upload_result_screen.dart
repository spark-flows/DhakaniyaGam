import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UploadResultScreen extends StatelessWidget {
  const UploadResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      initState: (state) {
        var controller = Get.find<DashboardController>();
        controller.getFullFamily();
        controller.percentController.clear();
        controller.totalMarksController.clear();
        controller.obtainedController.clear();
        controller.searchController.clear();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
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
              'upload_the_result'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          body: ListView(
            padding: Dimens.edgeInsets20,
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
                  items: controller.selectFullFamilyLists.isNotEmpty
                      ? controller.selectFullFamilyLists
                          .map((value) => DropdownMenuItem(
                                value: value.id,
                                child: Text(
                                    "${value.name ?? "Select Member"} ${value.fathername ?? ""} ${value.surname ?? ""}"),
                              ))
                          .toList()
                      : [],
                  onChanged: (newValue) {
                    controller.selectFullFamilyValue = newValue;
                    controller.update();
                  },
                ),
              ),
              Dimens.boxHeight10,
              Text(
                '* પહેલા ફેમિલી મેમ્બર દાખલ કરો.'.tr,
                style: Styles.redGuj50012,
              ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'select_medium'.tr,
                  style: Styles.grey9BA0A8Guj90016,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Radio<int>(
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: 1,
                          activeColor: ColorsValue.maincolor,
                          groupValue: controller.selectedOption,
                          onChanged: (value) {
                            controller.selectedOption = value!;
                            controller.update();
                          },
                        ),
                      ),
                      Dimens.boxWidth20,
                      Text(
                        'gujarati'.tr,
                        style: controller.selectedOption == 1
                            ? Styles.mainGuj80014
                            : Styles.blackGuj80014,
                      ),
                    ],
                  ),
                  Dimens.boxWidth10,
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Radio<int>(
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: 2,
                          activeColor: ColorsValue.maincolor,
                          groupValue: controller.selectedOption,
                          onChanged: (value) {
                            controller.selectedOption = value!;
                            controller.update();
                          },
                        ),
                      ),
                      Dimens.boxWidth10,
                      Text(
                        'english'.tr,
                        style: controller.selectedOption == 2
                            ? Styles.mainGuj80014
                            : Styles.blackGuj80014,
                      ),
                    ],
                  ),
                ],
              ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'choose_your_education'.tr,
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
              if (!(controller.selectValue?.contains("કોલેજ સેમ-2") ?? false) &&
                  !(controller.selectValue?.contains("કોલેજ સેમ-4") ?? false) &&
                  !(controller.selectValue?.contains("કોલેજ સેમ-5") ?? false) &&
                  !(controller.selectValue?.contains("કોલેજ સેમ-8") ??
                      false)) ...[
                CustomTextFormField(
                  controller: controller.totalMarksController,
                  fillColor: ColorsValue.greyEEEEEE,
                  text: "કુલ ગુણ",
                  isGujarati: true,
                  textInputAction: TextInputAction.next,
                  keybordtype: TextInputType.number,
                  validation: (p0) {
                    if (p0!.isEmpty) {
                      return 'કુલ ગુણ દાખલ કરો'.tr;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.percentController.clear();
                      controller.update();
                    }
                  },
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.obtainedController,
                  fillColor: ColorsValue.greyEEEEEE,
                  text: "મેળવેલ ગુણ",
                  isGujarati: true,
                  textInputAction: TextInputAction.next,
                  keybordtype: TextInputType.number,
                  validation: (p0) {
                    if (p0!.isEmpty) {
                      return 'મેળવેલ ગુણ દાખલ કરો'.tr;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.percentController.clear();
                      controller.update();
                    }
                  },
                ),
                Dimens.boxHeight20,
              ],
              CustomTextFormField(
                fillColor: ColorsValue.greyEEEEEE,
                text: controller.selectValue == "કોલેજ સેમ-2" ||
                        controller.selectValue == "કોલેજ સેમ-4" ||
                        controller.selectValue == "કોલેજ સેમ-6" ||
                        controller.selectValue == "કોલેજ સેમ-8"
                    ? 'your_SGPA'.tr
                    : 'your_percent'.tr,
                isGujarati: true,
                textInputAction: TextInputAction.next,
                controller: controller.percentController,
                validation: (p0) {
                  if (controller.obtainedController.text == "" ||
                      controller.totalMarksController.text == "") {
                    return "પહેલા મેળવેલ ગુણ અને કુલ ગુણ દાખલ કરો";
                  } else if (p0!.isEmpty) {
                    return 'enter_your_percent'.tr;
                  } else if (controller.selectValue == "કોલેજ સેમ-2" ||
                      controller.selectValue == "કોલેજ સેમ-4" ||
                      controller.selectValue == "કોલેજ સેમ-6" ||
                      controller.selectValue == "કોલેજ સેમ-8") {
                    if (double.parse(p0) < 0 || double.parse(p0) > 10) {
                      return 'enter_valid_sgpa'.tr;
                    }
                  } else if (double.parse(p0) < 1 || double.parse(p0) > 100) {
                    return 'enter_valid_your_percent'.tr;
                  }
                  return null;
                },
                onChanged: (value) {
                  if (controller.obtainedController.text == "" ||
                      controller.totalMarksController.text == "") {
                    controller.percentController.clear();
                  }
                  controller.update();
                },
              ),
              Dimens.boxHeight10,
              Text(
                'result_error'.tr,
                style: Styles.redGuj50012,
              ),
              // Dimens.boxHeight20,
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     'grade'.tr,
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
              //       'grade'.tr,
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
              //     value: controller.selectValue,
              //     items: controller.categoryLists
              //         .map((value) => DropdownMenuItem(
              //               value: value,
              //               child: Text(value),
              //             ))
              //         .toList(),
              //     onChanged: (newValue) {
              //       controller.selectValue = newValue;
              //       controller.update();
              //     },
              //   ),
              // ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'upload_result'.tr,
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
                      txt: 'add_photo'.tr,
                      onTap: () {
                        controller.uploadResult();
                      },
                      bgColor: ColorsValue.white,
                      svgPicture: AssetConstants.ic_photo,
                    ),
                    Visibility(
                      visible: controller.profilePic?.isNotEmpty ?? false,
                      child: CachedNetworkImage(
                        imageUrl:
                            ApiWrapper.imageUrl + (controller.profilePic ?? ""),
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
              Dimens.boxHeight40,
              CustomButton(
                onPressed: () {
                  if (controller.profilePic?.isEmpty ?? false) {
                    Utility.errorMessage("પરિણામ અપલોડ કરો");
                  } else {
                    controller.postAddResult();
                  }
                },
                text: 'submit'.tr,
              )
            ],
          ),
        );
      },
    );
  }
}
