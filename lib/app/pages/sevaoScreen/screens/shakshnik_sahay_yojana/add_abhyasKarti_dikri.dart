import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddAbhyasKartiDikri extends StatelessWidget {
  const AddAbhyasKartiDikri({super.key});

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
          centerTitle: false,
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
            'add_studying_daughters'.tr,
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
                    if (controller.selectFullFamilyValue == "") {
                      Utility.errorMessage("Select Education".tr);
                    } else if (controller.abhayasKey.currentState!.validate()) {
                      RouteManagement.goToValiniBankDetailScreen();
                    }
                  },
                  text: 'move_on'.tr,
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
                  value: controller.selectFullFamilyValue ?? "",
                  items: controller.selectFullFamilyLists
                      .map(
                        (value) => DropdownMenuItem(
                          value: value.id,
                          child: Text(
                            "${value.name} ${value.fathername ?? ""} ${value.surname ?? ""}",
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    controller.selectFullFamilyValue = newValue;
                    controller.update();
                  },
                ),
              ),
              Dimens.boxHeight20,
              CustomTextFormField(
                controller: controller.educationController,
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
              //     'choose_your_education'.tr,
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
              //       'choose_your_education'.tr,
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
              //     value: controller.selectEducationValue,
              //     items: controller.selectEducationLists
              //         .map((value) => DropdownMenuItem(
              //               value: value.id,
              //               child: Text(value.gujaratiName ?? ""),
              //             ))
              //         .toList(),
              //     onChanged: (newValue) {
              //       controller.selectEducationValue = newValue;
              //       controller.update();
              //     },
              //   ),
              // ),
              Dimens.boxHeight20,
              CustomTextFormField(
                fillColor: ColorsValue.greyEEEEEE,
                text: 'school_name'.tr,
                isGujarati: true,
                textInputAction: TextInputAction.next,
                controller: controller.schoolController,
                validation: (p0) {
                  if (p0!.isEmpty) {
                    return 'enter_school_name'.tr;
                  }
                  return null;
                },
              ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'school_collage_id_card'.tr,
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
                        controller.uploadDocument(ImageSource.gallery);
                      },
                      bgColor: ColorsValue.white,
                      svgPicture: AssetConstants.ic_photo,
                    ),
                    Visibility(
                      visible: controller.documentPic?.isNotEmpty ?? false,
                      child: CachedNetworkImage(
                        imageUrl: ApiWrapper.imageUrl +
                            (controller.documentPic ?? ""),
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
              CustomTextFormField(
                controller: controller.feeController,
                fillColor: ColorsValue.greyEEEEEE,
                text: 'fee_details'.tr,
                isGujarati: true,
                textInputAction: TextInputAction.next,
                validation: (p0) {
                  if (p0!.isEmpty) {
                    return 'enter_fee_details'.tr;
                  }
                  return null;
                },
              ),
              Dimens.boxHeight20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'photo_fee_receipt'.tr,
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
                        controller.uploadFeeReceipt(ImageSource.gallery);
                      },
                      bgColor: ColorsValue.white,
                      svgPicture: AssetConstants.ic_photo,
                    ),
                    Visibility(
                      visible: controller.feeReceiptPic?.isNotEmpty ?? false,
                      child: CachedNetworkImage(
                        imageUrl: ApiWrapper.imageUrl +
                            (controller.feeReceiptPic ?? ""),
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
              CustomTextFormField(
                controller: controller.remarkController,
                fillColor: ColorsValue.greyEEEEEE,
                text: 'remark'.tr,
                isGujarati: true,
                textInputAction: TextInputAction.next,
              ),
              Dimens.boxHeight30,
            ],
          ),
        )),
      ),
    );
  }
}
