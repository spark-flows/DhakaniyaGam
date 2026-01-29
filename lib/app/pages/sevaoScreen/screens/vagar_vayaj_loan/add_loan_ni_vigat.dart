import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddLoanNiVigatAddScreen extends StatelessWidget {
  const AddLoanNiVigatAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) {
        var controller = Get.find<SevaoController>();
        controller.businessCategoriesApi();
        controller.getChild();
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
              'details_interest_free_loan'.tr,
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
                      if (controller.profilePic == null) {
                        Utility.errorMessage("પ્રોફાઇલ ફોટો અપલોડ કરો.");
                      } else if (controller.selectChildValue?.isEmpty ??
                          false) {
                        Utility.errorMessage("વિદ્યાર્થીનું નામ પસંદ કરો.");
                      } else if (controller.rentPic == null) {
                        Utility.errorMessage("ભાડા કરારની PDF પસંદ કરો.");
                      } else if (controller.vayajKey.currentState!.validate()) {
                        RouteManagement.goTovidhyarthiniAbhyasVigatScreen();
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
            key: controller.vayajKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: Dimens.edgeInsets20_30_20_0,
              child: SingleChildScrollView(
                child: Column(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {
                                              Get.back();
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
                                                Get.back();
                                                if (await Utility
                                                    .imagePermissionCheack(
                                                        context)) {
                                                  controller.uploadProfilePic(
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
                                                Get.back();
                                                if (await Utility
                                                    .imagePermissionCheack(
                                                        context)) {
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
                    Dimens.boxHeight30,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'student_name'.tr,
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
                          'student_name'.tr,
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
                        value: controller.selectChildValue,
                        items: controller.selectChildLists.map((value) {
                          controller.memberName =
                              value.relation == "daughter" ? 'દીકરી' : "દીકરો";
                          controller.fullMemberName =
                              "${value.name} ${value.fathername} ${value.surname}";
                          return DropdownMenuItem(
                            value: value.id,
                            child: Text(
                                "${value.name ?? "Select Member"} ${value.fathername ?? ""} ${value.surname ?? ""}"),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.selectChildValue = newValue;
                          controller.update();
                        },
                      ),
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.currentAddressController,
                      text: 'current_address'.tr,
                      fillColor: ColorsValue.greyEEEEEE,
                      maxLines: 4,
                      validation: (p0) {
                        if (p0!.isEmpty) {
                          return 'હાલનું સરનામું દાખલ કરો';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.fatherBuisnessController,
                      text: 'father_business_detail'.tr,
                      fillColor: ColorsValue.greyEEEEEE,
                      validation: (p0) {
                        if (p0!.isEmpty) {
                          return 'પિતાના ધંધાની વિગત દાખલ કરો';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.fatherBuisnessAddressController,
                      text: 'father_address'.tr,
                      fillColor: ColorsValue.greyEEEEEE,
                      maxLines: 2,
                      validation: (p0) {
                        if (p0!.isEmpty) {
                          return 'પિતાના ધંધાનું સરનામું દાખલ કરો';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight20,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'rent_karar_pdf'.tr,
                        style: Styles.grey9BA0A8Guj90016,
                      ),
                    ),
                    Card(
                      elevation: 2,
                      color: ColorsValue.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        height: Dimens.eighty,
                        decoration: BoxDecoration(
                            color: ColorsValue.white,
                            borderRadius: BorderRadius.circular(Dimens.five)),
                        child: InkWell(
                          onTap: () async {
                            if (await controller.filePickPermissionCheack()) {
                              controller.uploadLoan();
                            }
                          },
                          child: DottedBorder(
                            color: ColorsValue.maincolor,
                            radius: Radius.circular(Dimens.five),
                            borderType: BorderType.RRect,
                            strokeWidth: Dimens.two,
                            dashPattern: [
                              Dimens.five,
                            ],
                            child: Padding(
                              padding: Dimens.edgeInsets10_00_10_00,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.picture_as_pdf,
                                    color: ColorsValue.greyA6A6A6,
                                  ),
                                  Dimens.boxWidth10,
                                  if (controller.rentPic?.isNotEmpty ??
                                      false) ...[
                                    Flexible(
                                      child: Center(
                                        child: Text(
                                          controller.rentFileName ?? "",
                                          style: Styles.greyA6A6A660014,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ] else ...[
                                    Center(
                                      child: Text(
                                        'rent_karar_pdf'.tr,
                                        style: Styles.greyA6A6A660014,
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
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
