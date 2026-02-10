import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/models/child_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddBalkoScreen extends StatelessWidget {
  const AddBalkoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) {
        var controller = Get.find<SevaoController>();
        controller.isEdit = Get.arguments[0] ?? false;
        controller.getAddChild();
        controller.getChildStudies();
        controller.businessCategoriesApi();
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
              'add_children'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          body: Padding(
            padding: Dimens.edgeInsets20_30_20_0,
            child: ListView(
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
                    value: controller.selectAddChildValue,
                    items: controller.selectAddChildLists.map((value) {
                      return DropdownMenuItem(
                        onTap: () {
                          controller.memberName =
                              value.relation == "daughter" ? 'દીકરી' : "દીકરો";
                          controller.fullMemberName =
                              "${value.name} ${value.fathername} ${value.surname}";
                          controller.update();
                        },
                        value: value.id,
                        child: Text(
                          "${value.name} ${value.fathername ?? ""} ${value.surname ?? ""}",
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      controller.selectAddChildValue = newValue;
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
                        lastDate: DateTime(2100),
                      );
                      if (picked != null && picked != controller.selectedDate) {
                        controller.selectedDate = picked;
                        controller.dobController.text =
                            DateFormat("dd MMM yyyy")
                                .format(controller.selectedDate);
                        controller.ageBalkoController.text = controller
                            .calculateAge(controller.dobController.text);

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
                  controller: controller.ageBalkoController,
                  text: 'age'.tr,
                  readOnly: true,
                  isGujarati: true,
                  fillColor: ColorsValue.greyEEEEEE,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.educationBalkoController,
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
                //     controller: controller.otherChildEducationController,
                //     text: 'other_education_name'.tr,
                //     isGujarati: true,
                //     fillColor: ColorsValue.greyEEEEEE,
                //   ),
                // ],
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.feeDeatilController,
                  text: 'fee_details'.tr,
                  isGujarati: true,
                  fillColor: ColorsValue.greyEEEEEE,
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
                          controller.uploadChildFeeReceipt(ImageSource.gallery);
                        },
                        bgColor: ColorsValue.white,
                        svgPicture: AssetConstants.ic_photo,
                      ),
                      Visibility(
                        visible: controller.feePic?.isNotEmpty ?? false,
                        child: CachedNetworkImage(
                          imageUrl:
                              ApiWrapper.imageUrl + (controller.feePic ?? ""),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'married_or_not'.tr,
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
                      'married_or_not'.tr,
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
                    value: controller.selectMarried,
                    items: controller.selectMarriedList
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Text(value ?? ""),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      controller.selectMarried = newValue;
                      controller.update();
                    },
                  ),
                ),
                Dimens.boxHeight20,
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'business'.tr,
                //     style: Styles.grey9BA0A8Guj90016,
                //   ),
                // ),
                CustomTextFormField(
                  controller: controller.businessController,
                  text: 'business'.tr,
                  isGujarati: true,
                  fillColor: ColorsValue.greyEEEEEE,
                ),
                // Container(
                //   height: Dimens.fifty,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(Dimens.six),
                //     color: ColorsValue.greyEEEEEE,
                //   ),
                //   child: DropdownButton<String>(
                //     underline: Container(),
                //     hint: Text(
                //       'business'.tr,
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
                //     value: controller.selectBusinessValue,
                //     items: controller.selectBusinessLists
                //         .map((value) => DropdownMenuItem(
                //               value: value.id,
                //               child: Text(
                //                 value.gujaratiName ?? "",
                //               ),
                //             ))
                //         .toList(),
                //     onChanged: (newValue) {
                //       controller.selectBusinessValue = newValue;
                //       controller.update();
                //     },
                //   ),
                // ),
                // if (controller.selectBusinessValue == "") ...[
                //   Dimens.boxHeight20,
                //   CustomTextFormField(
                //     controller: controller.otherChildBusinessController,
                //     text: 'other_business_name'.tr,
                //     isGujarati: true,
                //     fillColor: ColorsValue.greyEEEEEE,
                //   ),
                // ],
                Dimens.boxHeight30,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onPressed: () async {
                      var data = controller.childList.any((element) =>
                          element.familymember !=
                          controller.selectAddChildValue);
                      if (controller.isEdit) {
                        var childModel = ChildsModel()
                          ..familymember = controller.selectAddChildValue
                          ..dob = controller.dobController.text
                          ..education = controller.selectChildEducationValue
                          ..fees =
                              int.parse(controller.feeDeatilController.text)
                          ..feeReceipt = controller.feePic
                          ..isMarried =
                              controller.selectMarried == "હા" ? true : false
                          ..business = controller.businessController.text
                          ..fullname = controller.fullMemberName
                          ..relation = controller.memberName
                          ..otherBusiness =
                              controller.otherChildBusinessController.text;
                        await controller.box.put(Get.arguments[1], childModel);
                        await controller.getAllBalkoList();
                        controller.allDataEmptyBalko();
                        Navigator.pop(context);
                      } else if (!data) {
                        var childModel = ChildsModel()
                          ..familymember = controller.selectAddChildValue
                          ..dob = controller.dobController.text
                          ..education = controller.selectChildEducationValue
                          ..fees =
                              int.parse(controller.feeDeatilController.text)
                          ..feeReceipt = controller.feePic
                          ..isMarried =
                              controller.selectMarried == "હા" ? true : false
                          ..business = controller.businessController.text
                          ..fullname = controller.fullMemberName
                          ..relation = controller.memberName
                          ..otherBusiness =
                              controller.otherChildBusinessController.text;
                        await controller.box.add(childModel);
                        await controller.getAllBalkoList();
                        controller.allDataEmptyBalko();Navigator.pop(context);
                      } else {
                        Utility.errorMessage("બાળક ઉમેરો");
                      }
                      controller.update();
                    },
                    text: 'submit'.tr,
                    height: Dimens.fifty,
                  ),
                ),
                Dimens.boxHeight30,
              ],
            ),
          ),
        );
      },
    );
  }
}
