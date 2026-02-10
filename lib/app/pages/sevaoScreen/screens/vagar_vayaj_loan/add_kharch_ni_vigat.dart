import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KharchNiVigatScreen extends StatelessWidget {
  const KharchNiVigatScreen({super.key});

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
            'expense_details'.tr,
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
                    if (controller.feeReceiptKharachPic == null) {
                      Utility.errorMessage("ફી-રસીદનો ફોટો પસંદ કરો.");
                    } else if (controller.feeReceiptHostelPic == null) {
                      Utility.errorMessage(
                          "સંસ્થાની હોસ્ટેલ ફી-રસીદનો ફોટો પસંદ કરો.");
                    } else if (controller.rentKey.currentState!.validate()) {
                      RouteManagement.goToKutumbMaKamataSabhyScreen();
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
          key: controller.rentKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets20_30_20_0,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller.annualSemesterFeeController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'annual_semester_fee'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.number,
                    validation: (p0) {
                      if (p0!.isEmpty) {
                        return 'સંસ્થાની વાર્ષિક સેમેસ્ટર ફી દાખલ કરો';
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
                          txt: 'photo_fee_receipt'.tr,
                          onTap: () {
                            controller.feeReceipt(ImageSource.gallery);
                          },
                          bgColor: ColorsValue.white,
                          svgPicture: AssetConstants.ic_photo,
                        ),
                        Visibility(
                          visible:
                              controller.feeReceiptKharachPic?.isNotEmpty ??
                                  false,
                          child: CachedNetworkImage(
                            imageUrl: ApiWrapper.imageUrl +
                                (controller.feeReceiptKharachPic ?? ""),
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
                    controller: controller.brachHostelFeeController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'branch_hostel_fee'.tr,
                    keybordtype: TextInputType.number,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    validation: (p0) {
                      if (p0!.isEmpty) {
                        return 'સંસ્થાની હોસ્ટેલ ફી દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'branch_hostel_fee_recipt'.tr,
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
                          txt: 'branch_hostel_fee_recipt'.tr,
                          onTap: () {
                            controller.feeReceiptHostel(ImageSource.gallery);
                          },
                          bgColor: ColorsValue.white,
                          svgPicture: AssetConstants.ic_photo,
                        ),
                        Visibility(
                          visible: controller.feeReceiptHostelPic?.isNotEmpty ??
                              false,
                          child: CachedNetworkImage(
                            imageUrl: ApiWrapper.imageUrl +
                                (controller.feeReceiptHostelPic ?? ""),
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
                    controller: controller.otherExpenseController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'other_expenses'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      var total = int.parse(
                              controller.annualSemesterFeeController.text) +
                          int.parse(controller.brachHostelFeeController.text) +
                          int.parse(controller.otherExpenseController.text);
                      controller.totalExpenseController.text = total.toString();
                      controller.update();
                    },
                    validation: (p0) {
                      if (p0!.isEmpty) {
                        return 'અન્ય ખર્ચ દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    readOnly: true,
                    controller: controller.totalExpenseController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'total_cost'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                  ),
                  Dimens.boxHeight20,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
