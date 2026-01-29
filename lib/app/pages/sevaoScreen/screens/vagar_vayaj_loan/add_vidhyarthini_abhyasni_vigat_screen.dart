import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VidhyarthiniAbhyasNiVigat extends StatelessWidget {
  const VidhyarthiniAbhyasNiVigat({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) {
        var controller = Get.find<SevaoController>();
        controller.getChildStudies();
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
              'student_study_detail'.tr,
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
                      if (controller.studentKey.currentState!.validate()) {
                        RouteManagement.goToabhyasKramNiVigatScreen();
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
            key: controller.studentKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Padding(
                padding: Dimens.edgeInsets20_30_20_0,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: controller.educationStudentController,
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
                    //     'choose_education'.tr,
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
                    //       'choose_education'.tr,
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
                    //     value: controller.selectChildEducationValue,
                    //     items: controller.selecChildEducationLists
                    //         .map((value) => DropdownMenuItem(
                    //               value: value.id,
                    //               child: Text(
                    //                 value.gujaratiName ?? "",
                    //               ),
                    //             ))
                    //         .toList(),
                    //     onChanged: (newValue) {
                    //       controller.selectChildEducationValue = newValue;
                    //       controller.update();
                    //     },
                    //   ),
                    // ),
                    // if (controller.selectChildEducationValue == "") ...[
                    //   Dimens.boxHeight20,
                    //   CustomTextFormField(
                    //     controller: controller.studentOtherController,
                    //     text: 'other_education_name'.tr,
                    //     isGujarati: true,
                    //     fillColor: ColorsValue.greyEEEEEE,
                    //   ),
                    // ],
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.schoolNameController,
                      text: 'school_name'.tr,
                      isGujarati: true,
                      fillColor: ColorsValue.greyEEEEEE,
                      validation: (p0) {
                        if (p0!.isEmpty) {
                          return 'શાળા/કોલેજનું નામ દાખલ કરો';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.passYearController,
                      text: 'year_of_passing'.tr,
                      isGujarati: true,
                      keybordtype: TextInputType.number,
                      fillColor: ColorsValue.greyEEEEEE,
                      validation: (p0) {
                        if (p0!.isEmpty) {
                          return 'પાસ કર્યાનું વર્ષ દાખલ કરો';
                        }
                        return null;
                      },
                    ),
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
                            txt: 'upload_result'.tr,
                            onTap: () {
                              controller.uploadResult(ImageSource.gallery);
                            },
                            bgColor: ColorsValue.white,
                            svgPicture: AssetConstants.ic_photo,
                          ),
                          Visibility(
                            visible: controller.resultPic?.isNotEmpty ?? false,
                            child: CachedNetworkImage(
                              imageUrl: ApiWrapper.imageUrl +
                                  (controller.resultPic ?? ""),
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
                    Dimens.boxHeight20,
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
