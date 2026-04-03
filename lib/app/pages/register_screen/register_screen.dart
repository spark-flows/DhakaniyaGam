import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.white,
        body: Form(
          key: controller.registerKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets20_50_20_00,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Registration',
                      style: Styles.main70030,
                    ),
                  ),
                  Dimens.boxHeight30,
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
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
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
                                                  padding: Dimens.edgeInsets10,
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
                                                  padding: Dimens.edgeInsets10,
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
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'મુખ્ય સભ્યની અટક',
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.surnameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'મુખ્ય સભ્યની અટક દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'મુખ્ય સભ્યનું નામ',
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.nameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'મુખ્ય સભ્યનું નામ દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'મુખ્ય સભ્યના પિતાનું નામ',
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.fatherNameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'મુખ્ય સભ્યના પિતાનું નામ દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  // Dimens.boxHeight20,
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'સભ્યના ગામનું નામ',
                  //     style: Styles.grey9BA0A8Guj90016,
                  //   ),
                  // ),
                  // Container(
                  //   height: Dimens.fifty,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(Dimens.six),
                  //       color: ColorsValue.greyEEEEEE),
                  //   child: DropdownButton<String>(
                  //     underline: Container(),
                  //     hint: Text(
                  //       'સભ્યના ગામનું નામ',
                  //       style: Styles.grey9BA0A8Guj90016,
                  //     ),
                  //     padding:
                  //         EdgeInsets.only(left: Dimens.ten, right: Dimens.ten),
                  //     isExpanded: true,
                  //     icon: SvgPicture.asset(AssetConstants.ic_down_arrow),
                  //     value: controller.selectValue,
                  //     items: controller.categoryLists
                  //         .map((value) => DropdownMenuItem(
                  //               value: value.id,
                  //               child: Text(value.gujaratiName ?? ''),
                  //             ))
                  //         .toList(),
                  //     onChanged: (newValue) {
                  //       controller.selectValue = newValue;
                  //       controller.update();
                  //     },
                  //   ),
                  // ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'ઈમેલ',
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    keybordtype: TextInputType.emailAddress,
                    controller: controller.emailController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'ઈમેલ દાખલ કરો';
                      } else if (!Utility.emailValidator(value)) {
                        return 'માન્ય ઇમેઇલ દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'મોબાઈલ નંબર',
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
                    textEditingController: controller.mobileNumberController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "મોબાઈલ નંબર દાખલ કરો";
                      } else if (!controller.isValid) {
                        return "માન્ય મોબાઈલ નંબર દાખલ કરો";
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'રહેઠાણનું હાલનું સરનામું',
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.addressController,
                    maxLines: 3,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'રહેઠાણનું હાલનું સરનામું દાખલ કરો';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ધંધો - વ્યવસાય',
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
                      hint: Text('ધંધો - વ્યવસાય',
                          style: Styles.grey9BA0A8Guj90016),
                      padding:
                          EdgeInsets.only(left: Dimens.ten, right: Dimens.ten),
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
                  // Dimens.boxHeight20,
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'તમારા ગામ પ્રતિનિધિ પસંદ કરો',
                  //     style: Styles.grey9BA0A8Guj90016,
                  //   ),
                  // ),
                  // Container(
                  //   height: Dimens.fifty,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(Dimens.six),
                  //       color: ColorsValue.greyEEEEEE),
                  //   child: DropdownButton<String>(
                  //     underline: Container(),
                  //     hint: Text('તમારા ગામ પ્રતિનિધિ પસંદ કરો',
                  //         style: Styles.grey9BA0A8Guj90016),
                  //     padding:
                  //         EdgeInsets.only(left: Dimens.ten, right: Dimens.ten),
                  //     isExpanded: true,
                  //     icon: SvgPicture.asset(AssetConstants.ic_down_arrow),
                  //     value: controller.selectCommitteeValue,
                  //     items: controller.selectCommitteeLists
                  //         .map((value) => DropdownMenuItem(
                  //               onTap: () {
                  //                 controller.fullname =
                  //                     "${value.user?.name ?? ""} ${value.user?.fathername ?? ""} ${value.user?.surname ?? ""}";
                  //                 controller.update();
                  //               },
                  //               value: value.id,
                  //               child: Text(
                  //                   "${value.user?.name ?? ""} ${value.user?.fathername ?? ""} ${value.user?.surname ?? ""}"),
                  //             ))
                  //         .toList(),
                  //     onChanged: (newValue) {
                  //       controller.selectCommitteeValue = newValue;
                  //       controller.update();
                  //     },
                  //   ),
                  // ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'અપલોડ આગળ આધાર કાર્ડ',
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
                          txt: 'Add Photo',
                          onTap: () {
                            controller.uploadFrontAdharPic();
                          },
                          bgColor: ColorsValue.white,
                          svgPicture: AssetConstants.ic_photo,
                        ),
                        Visibility(
                          visible:
                              controller.frontAdharPic?.isNotEmpty ?? false,
                          child: CachedNetworkImage(
                            imageUrl: ApiWrapper.imageUrl +
                                (controller.frontAdharPic ?? ""),
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
                      'અપલોડ પાછળ આધાર કાર્ડ',
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
                          txt: 'Add Photo',
                          onTap: () {
                            controller.uploadBackAdharPic();
                          },
                          bgColor: ColorsValue.white,
                          svgPicture: AssetConstants.ic_photo,
                        ),
                        Visibility(
                          visible: controller.backAdharPic?.isNotEmpty ?? false,
                          child: CachedNetworkImage(
                            imageUrl: ApiWrapper.imageUrl +
                                (controller.backAdharPic ?? ""),
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
                      if (controller.registerKey.currentState!.validate()) {
                        controller.registerApi();
                      }
                    },
                    text: 'આગળ વધો',
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
