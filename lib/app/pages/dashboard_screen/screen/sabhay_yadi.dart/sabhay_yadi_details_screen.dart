import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/data/helpers/api_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SabhayYadiDeatilsScreen extends StatelessWidget {
  const SabhayYadiDeatilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(initState: (state) async {
      var controller = Get.find<DashboardController>();
      controller.getOneUserDetailsData = null;
      controller.userId = Get.arguments ?? "";
      await controller.getOneUsers();
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
            'member_details'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: controller.getOneUserDetailsData != null
            ? ListView(
                padding: Dimens.edgeInsets20,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Dimens.seventyFive,
                        width: Dimens.seventyFive,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimens.hundred,
                          ),
                          color: ColorsValue.maincolor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimens.hundred),
                          child: CachedNetworkImage(
                            imageUrl: ApiWrapper.imageUrl +
                                (controller.getOneUserDetailsData?.mainMember
                                        ?.profilePic ??
                                    ""),
                            fit: BoxFit.cover,
                            maxHeightDiskCache: 90,
                            maxWidthDiskCache: 90,
                            width: Dimens.seventyFive,
                            height: Dimens.seventyFive,
                            placeholder: (context, url) => Image.asset(
                              AssetConstants.usera,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              AssetConstants.usera,
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxWidth10,
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.getOneUserDetailsData?.mainMember?.name} ${controller.getOneUserDetailsData?.mainMember?.fathername} ${controller.getOneUserDetailsData?.mainMember?.surname}",
                              style: Styles.black2E363F50018,
                              maxLines: 2,
                            ),
                            Text(
                              controller.getOneUserDetailsData?.mainMember
                                      ?.village?.gujaratiName ??
                                  "",
                              style: Styles.grey9393Guj60014,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Dimens.boxHeight20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetConstants.ic_call,
                      ),
                      Dimens.boxWidth10,
                      Text(
                        controller.getOneUserDetailsData?.mainMember?.mobile
                                    ?.isEmpty ??
                                false
                            ? " -- "
                            : "${controller.getOneUserDetailsData?.mainMember?.countryCode} ${controller.getOneUserDetailsData?.mainMember?.mobile}",
                        style: Styles.grey9393Guj60014,
                      )
                    ],
                  ),
                  Dimens.boxHeight20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetConstants.ic_call,
                      ),
                      Dimens.boxWidth10,
                      Text(
                        controller.getOneUserDetailsData?.mainMember
                                    ?.optionalMobile?.isEmpty ??
                                false
                            ? " -- "
                            : "${controller.getOneUserDetailsData?.mainMember?.optionalCountryCode} ${controller.getOneUserDetailsData?.mainMember?.optionalMobile}",
                        style: Styles.grey9393Guj60014,
                        maxLines: 2,
                      )
                    ],
                  ),
                  // Dimens.boxHeight20,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     SvgPicture.asset(
                  //       AssetConstants.ic_location,
                  //     ),
                  //     Dimens.boxWidth10,
                  //     Flexible(
                  //       child: Text(
                  //         controller.getOneUserDetailsData?.mainMember
                  //                     ?.currentAddress?.isNotEmpty ??
                  //                 false
                  //             ? controller.getOneUserDetailsData?.mainMember
                  //                     ?.currentAddress ??
                  //                 ""
                  //             : " -- ",
                  //         maxLines: 3,
                  //         overflow: TextOverflow.ellipsis,
                  //         style: Styles.grey9393Guj60014,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // Dimens.boxHeight20,
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(
                  //       AssetConstants.ic_email,
                  //     ),
                  //     Dimens.boxWidth10,
                  //     Flexible(
                  //       child: Text(
                  //         controller.getOneUserDetailsData?.mainMember?.email
                  //                     ?.isEmpty ??
                  //                 false
                  //             ? " -- "
                  //             : controller.getOneUserDetailsData?.mainMember
                  //                     ?.email ??
                  //                 " -- ",
                  //         style: Styles.grey9393Guj60014,
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // Dimens.boxHeight20,
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(
                  //       AssetConstants.calendar,
                  //     ),
                  //     Dimens.boxWidth10,
                  //     Text(
                  //       controller.getOneUserDetailsData?.mainMember?.dob
                  //                   ?.isEmpty ??
                  //               false
                  //           ? " -- "
                  //           : Utility.getFormatedDateTime(controller
                  //                   .getOneUserDetailsData?.mainMember?.dob ??
                  //               " -- "),
                  //       style: Styles.grey9393Guj60014,
                  //     )
                  //   ],
                  // ),
                  // Dimens.boxHeight20,
                  // Row(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         SvgPicture.asset(
                  //           AssetConstants.ic_blood,
                  //         ),
                  //         Dimens.boxWidth10,
                  //         Text(
                  //           controller.getOneUserDetailsData?.mainMember
                  //                       ?.bloodGroup?.isEmpty ??
                  //                   false
                  //               ? " -- "
                  //               : controller.getOneUserDetailsData?.mainMember
                  //                       ?.bloodGroup ??
                  //                   " -- ",
                  //           style: Styles.grey9393Guj60014,
                  //         )
                  //       ],
                  //     ),
                  //     Dimens.boxWidth10,
                  //     Container(
                  //       width: Dimens.one,
                  //       height: Dimens.thirty,
                  //       color: ColorsValue.grey9393,
                  //     ),
                  //     Flexible(
                  //       child: Row(
                  //         children: [
                  //           Dimens.boxWidth20,
                  //           SvgPicture.asset(
                  //             AssetConstants.ic_education,
                  //           ),
                  //           Dimens.boxWidth10,
                  //           Flexible(
                  //             child: Text(
                  //               controller.getOneUserDetailsData?.mainMember
                  //                       ?.education?.gujaratiName ??
                  //                   " -- ",
                  //               style: Styles.grey9393Guj60014,
                  //               maxLines: 2,
                  //               overflow: TextOverflow.ellipsis,
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Dimens.boxHeight20,
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(
                  //       AssetConstants.ic_business,
                  //     ),
                  //     Dimens.boxWidth10,
                  //     Text(
                  //       controller.getOneUserDetailsData?.mainMember?.business
                  //               ?.gujaratiName ??
                  //           " -- ",
                  //       style: Styles.grey9393Guj60014,
                  //     )
                  //   ],
                  // ),
                  // Dimens.boxHeight30,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "ફર્મનું નામ:",
                  //       style: Styles.grey9393Guj60014,
                  //     ),
                  //     Dimens.boxWidth5,
                  //     Flexible(
                  //       child: Text(
                  //         controller.getOneUserDetailsData?.mainMember?.firmName
                  //                     ?.isNotEmpty ??
                  //                 false
                  //             ? controller.getOneUserDetailsData?.mainMember
                  //                     ?.firmName ??
                  //                 " -- "
                  //             : " -- ",
                  //         style: Styles.blackGuj60014,
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Dimens.boxHeight15,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "ધંધો - વ્યવસાયનું સરનામું:",
                  //       style: Styles.grey9393Guj60014,
                  //     ),
                  //     Dimens.boxWidth5,
                  //     Flexible(
                  //       child: Text(
                  //         controller.getOneUserDetailsData?.mainMember
                  //                 ?.businessAddress ??
                  //             " -- ",
                  //         style: Styles.blackGuj60014,
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Dimens.boxHeight15,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "ધંધો - વ્યવસાયની વિગત:",
                  //       style: Styles.grey9393Guj60014,
                  //     ),
                  //     Dimens.boxWidth5,
                  //     Flexible(
                  //       child: Text(
                  //         controller.getOneUserDetailsData?.mainMember
                  //                 ?.businessDetails ??
                  //             " -- ",
                  //         style: Styles.blackGuj60014,
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Dimens.boxHeight15,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "દામ્પત્ય જીવનની શરૂઆત:",
                  //       style: Styles.grey9393Guj60014,
                  //     ),
                  //     Dimens.boxWidth5,
                  //     Flexible(
                  //       child: Text(
                  //         controller.getOneUserDetailsData?.mainMember?.dom
                  //                     ?.isEmpty ??
                  //                 false
                  //             ? " -- "
                  //             : Utility.getFormatedDateTime(controller
                  //                     .getOneUserDetailsData?.mainMember?.dom ??
                  //                 " -- "),
                  //         style: Styles.blackGuj60014,
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Visibility(
                  //   visible: controller
                  //           .getOneUserDetailsData?.mainMember?.isMarried ??
                  //       false,
                  //   child: Column(
                  //     children: [
                  //       Dimens.boxHeight15,
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "સસરાનુું નામ:",
                  //             style: Styles.grey9393Guj60014,
                  //           ),
                  //           Dimens.boxWidth5,
                  //           Flexible(
                  //             child: Text(
                  //               controller.getOneUserDetailsData?.mainMember
                  //                           ?.fatherInLaw?.name?.isNotEmpty ??
                  //                       false
                  //                   ? "${controller.getOneUserDetailsData?.mainMember?.fatherInLaw?.name} ${controller.getOneUserDetailsData?.mainMember?.fatherInLaw?.fathername} ${controller.getOneUserDetailsData?.mainMember?.fatherInLaw?.surname}"
                  //                   : " -- ",
                  //               style: Styles.blackGuj60014,
                  //               maxLines: 2,
                  //               overflow: TextOverflow.ellipsis,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       Dimens.boxHeight15,
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "સસરાના ગામનું નામ:",
                  //             style: Styles.grey9393Guj60014,
                  //           ),
                  //           Dimens.boxWidth5,
                  //           Flexible(
                  //             child: Text(
                  //               controller.getOneUserDetailsData?.mainMember
                  //                       ?.fatherInLaw?.village ??
                  //                   " -- ",
                  //               style: Styles.blackGuj60014,
                  //               maxLines: 2,
                  //               overflow: TextOverflow.ellipsis,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       Dimens.boxHeight15,
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "સસરાના તાલુકાનું નામ:",
                  //             style: Styles.grey9393Guj60014,
                  //           ),
                  //           Dimens.boxWidth5,
                  //           Flexible(
                  //             child: Text(
                  //               controller.getOneUserDetailsData?.mainMember
                  //                       ?.fatherInLaw?.taluka ??
                  //                   " -- ",
                  //               style: Styles.blackGuj60014,
                  //               maxLines: 2,
                  //               overflow: TextOverflow.ellipsis,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       Dimens.boxHeight15,
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "સસરાના જિલ્લાનું નામ:",
                  //             style: Styles.grey9393Guj60014,
                  //           ),
                  //           Dimens.boxWidth5,
                  //           Flexible(
                  //             child: Text(
                  //               controller.getOneUserDetailsData?.mainMember
                  //                       ?.fatherInLaw?.district ??
                  //                   " -- ",
                  //               style: Styles.blackGuj60014,
                  //               maxLines: 2,
                  //               overflow: TextOverflow.ellipsis,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Dimens.boxHeight15,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "સુરતમાં મકાન:",
                  //       style: Styles.grey9393Guj60014,
                  //     ),
                  //     Dimens.boxWidth5,
                  //     Flexible(
                  //       child: Text(
                  //         controller.getOneUserDetailsData?.mainMember
                  //                     ?.residentialType?.isNotEmpty ??
                  //                 false
                  //             ? controller.getOneUserDetailsData?.mainMember
                  //                     ?.residentialType ??
                  //                 " -- "
                  //             : " -- ",
                  //         style: Styles.blackGuj60014,
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Dimens.boxHeight15,
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "મેડિક્લેમ:",
                  //       style: Styles.grey9393Guj60014,
                  //     ),
                  //     Dimens.boxWidth5,
                  //     Flexible(
                  //       child: controller.getOneUserDetailsData?.mainMember
                  //                   ?.mediclaims?.isNotEmpty ??
                  //               false
                  //           ? Wrap(
                  //               children: controller.getOneUserDetailsData
                  //                       ?.mainMember?.mediclaims
                  //                       ?.map(
                  //                     (e) {
                  //                       return Text(
                  //                         "$e, ",
                  //                         style: Styles.blackGuj60014,
                  //                       );
                  //                     },
                  //                   ).toList() ??
                  //                   [],
                  //             )
                  //           : Text(
                  //               " -- ",
                  //               style: Styles.blackGuj60014,
                  //             ),
                  //     )
                  //   ],
                  // ),
                  // Dimens.boxHeight15,
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "વિશિષ્ટ પ્રતિભા / કૌશલ્ય / અવોર્ડ /સામાજિક રાજકિય હોદ્દો / સરકારી નોકરી / અન્ય:",
                  //       maxLines: 2,
                  //       style: Styles.grey9393Guj60014,
                  //     ),
                  //     Dimens.boxWidth5,
                  //     Text(
                  //       controller.getOneUserDetailsData?.mainMember?.other
                  //                   ?.isNotEmpty ??
                  //               false
                  //           ? controller
                  //                   .getOneUserDetailsData?.mainMember?.other ??
                  //               " -- "
                  //           : " -- ",
                  //       style: Styles.blackGuj60014,
                  //       maxLines: 2,
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //   ],
                  // ),
                  Dimens.boxHeight30,
                  Visibility(
                    visible: controller.getOneUserDetailsData?.familyMembers
                                ?.isNotEmpty ??
                            false
                        ? true
                        : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'family_details'.tr,
                          style: Styles.black2E363F60018,
                        ),
                        Dimens.boxHeight5,
                        Wrap(
                          children: controller
                                  .getOneUserDetailsData?.familyMembers
                                  ?.asMap()
                                  .entries
                                  .map((e) {
                                return Padding(
                                  padding: Dimens.edgeInsetsTopt10,
                                  child: Container(
                                      padding: Dimens.edgeInsets10,
                                      decoration: BoxDecoration(
                                          color: ColorsValue.white,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.six,
                                          ),
                                          border: Border.all(
                                              width: Dimens.one,
                                              color: ColorsValue.maincolor)),
                                      child: Row(
                                        spacing: Dimens.ten,
                                        children: [
                                          Container(
                                            width: Dimens.sixty,
                                            height: Dimens.thirty,
                                            decoration: BoxDecoration(
                                              color: ColorsValue.lightMainColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimens.five,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                e.value.relation == "mother"
                                                    ? "માતા"
                                                    : e.value.relation ==
                                                            "father"
                                                        ? "પિતા"
                                                        : e.value.relation ==
                                                                "wife"
                                                            ? "પત્ની"
                                                            : e.value.relation ==
                                                                    "sister"
                                                                ? "બહેન"
                                                                : e.value.relation ==
                                                                        "brother"
                                                                    ? "ભાઈ"
                                                                    : e.value.relation ==
                                                                            "daughter"
                                                                        ? "દીકરી"
                                                                        : "દીકરો",
                                                style: Styles.mainGuj60012,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              "${e.value.name} ${e.value.fathername} ${e.value.surname}",
                                              style: Styles.black2E363F60014,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      )

                                      // ExpansionTile(
                                      //   leading: Container(
                                      //     width: Dimens.sixty,
                                      //     height: Dimens.thirty,
                                      //     decoration: BoxDecoration(
                                      //       color: ColorsValue.lightMainColor,
                                      //       borderRadius: BorderRadius.circular(
                                      //         Dimens.five,
                                      //       ),
                                      //     ),
                                      //     child: Center(
                                      //       child: Text(
                                      //         e.value.relation == "mother"
                                      //             ? "માતા"
                                      //             : e.value.relation == "father"
                                      //                 ? "પિતા"
                                      //                 : e.value.relation == "wife"
                                      //                     ? "પત્ની"
                                      //                     : e.value.relation ==
                                      //                             "sister"
                                      //                         ? "બહેન"
                                      //                         : e.value.relation ==
                                      //                                 "brother"
                                      //                             ? "ભાઈ"
                                      //                             : e.value.relation ==
                                      //                                     "daughter"
                                      //                                 ? "દીકરી"
                                      //                                 : "દીકરો",
                                      //         style: Styles.mainGuj60012,
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   title: Text(
                                      //     "${e.value.name} ${e.value.fathername} ${e.value.surname}",
                                      //     style: Styles.black2E363F60014,
                                      //     maxLines: 1,
                                      //     overflow: TextOverflow.ellipsis,
                                      //   ),
                                      //   childrenPadding:
                                      //       Dimens.edgeInsets30_10_30_10,
                                      //   children: [
                                      //     Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Text(
                                      //           "જન્મ તારીખ:",
                                      //           style: Styles.grey9393Guj60014,
                                      //         ),
                                      //         Dimens.boxWidth5,
                                      //         Flexible(
                                      //           child: Text(
                                      //             e.value.dob ?? " -- ",
                                      //             style: Styles.blackGuj60014,
                                      //             maxLines: 2,
                                      //             overflow: TextOverflow.ellipsis,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Dimens.boxHeight10,
                                      //     Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Text(
                                      //           "ઉંમર:",
                                      //           style: Styles.grey9393Guj60014,
                                      //         ),
                                      //         Dimens.boxWidth5,
                                      //         Flexible(
                                      //           child: Text(
                                      //             e.value.dob?.isNotEmpty ?? false
                                      //                 ? Utility.calculateAge(
                                      //                         DateTime.parse(
                                      //                             e.value.dob ??
                                      //                                 " -- "))
                                      //                     .toString()
                                      //                 : " -- ",
                                      //             style: Styles.blackGuj60014,
                                      //             maxLines: 2,
                                      //             overflow: TextOverflow.ellipsis,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Dimens.boxHeight10,
                                      //     Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Text(
                                      //           "રક્ત જૂથ:",
                                      //           style: Styles.grey9393Guj60014,
                                      //         ),
                                      //         Dimens.boxWidth5,
                                      //         Flexible(
                                      //           child: Text(
                                      //             e.value.bloodGroup ?? " -- ",
                                      //             style: Styles.blackGuj60014,
                                      //             maxLines: 2,
                                      //             overflow: TextOverflow.ellipsis,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Dimens.boxHeight10,
                                      //     Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Text(
                                      //           "શિક્ષણ",
                                      //           style: Styles.grey9393Guj60014,
                                      //         ),
                                      //         Dimens.boxWidth5,
                                      //         Flexible(
                                      //           child: Text(
                                      //             e.value.business?.gujaratiName
                                      //                         ?.isEmpty ??
                                      //                     false
                                      //                 ? e.value.otherBusiness
                                      //                             ?.isNotEmpty ??
                                      //                         false
                                      //                     ? e.value
                                      //                             .otherBusiness ??
                                      //                         " -- "
                                      //                     : e.value.business
                                      //                             ?.gujaratiName ??
                                      //                         " -- "
                                      //                 : " -- ",
                                      //             style: Styles.blackGuj60014,
                                      //             maxLines: 2,
                                      //             overflow: TextOverflow.ellipsis,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Dimens.boxHeight10,
                                      //     Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Text(
                                      //           "વ્યવસાય",
                                      //           style: Styles.grey9393Guj60014,
                                      //         ),
                                      //         Dimens.boxWidth5,
                                      //         Flexible(
                                      //           child: Text(
                                      //             e.value.education?.gujaratiName
                                      //                         ?.isEmpty ??
                                      //                     false
                                      //                 ? e.value.otherEducation
                                      //                             ?.isNotEmpty ??
                                      //                         false
                                      //                     ? e.value
                                      //                             .otherEducation ??
                                      //                         " -- "
                                      //                     : e.value.education
                                      //                             ?.gujaratiName ??
                                      //                         " -- "
                                      //                 : " -- ",
                                      //             style: Styles.blackGuj60014,
                                      //             maxLines: 2,
                                      //             overflow: TextOverflow.ellipsis,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ],
                                      // ),

                                      ),
                                );
                              }).toList() ??
                              [],
                        ),
                      ],
                    ),
                  ),
                  Dimens.boxHeight30,
                  Visibility(
                    visible: controller.getOneUserDetailsData?.foreigners
                                ?.isNotEmpty ??
                            false
                        ? true
                        : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'village_details'.tr,
                          style: Styles.black2E363F60018,
                        ),
                        Dimens.boxHeight10,
                        Wrap(
                          children: controller.getOneUserDetailsData?.foreigners
                                  ?.asMap()
                                  .entries
                                  .map((e) {
                                return Padding(
                                  padding: Dimens.edgeInsetsTopt10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorsValue.white,
                                        borderRadius: BorderRadius.circular(
                                          Dimens.six,
                                        ),
                                        border: Border.all(
                                            width: Dimens.one,
                                            color: ColorsValue.maincolor)),
                                    child: ExpansionTile(
                                      leading: Container(
                                        width: Dimens.sixty,
                                        height: Dimens.thirty,
                                        decoration: BoxDecoration(
                                          color: ColorsValue.lightMainColor,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.five,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            e.value.familymemberId?.relation ==
                                                    "mother"
                                                ? "માતા"
                                                : e.value.familymemberId
                                                            ?.relation ==
                                                        "father"
                                                    ? "પિતા"
                                                    : e.value.familymemberId
                                                                ?.relation ==
                                                            "wife"
                                                        ? "પત્ની"
                                                        : e.value.familymemberId
                                                                    ?.relation ==
                                                                "sister"
                                                            ? "બહેન"
                                                            : e.value.familymemberId
                                                                        ?.relation ==
                                                                    "brother"
                                                                ? "ભાઈ"
                                                                : e.value.familymemberId
                                                                            ?.relation ==
                                                                        "daughter"
                                                                    ? "દીકરી"
                                                                    : "દીકરો",
                                            style: Styles.mainGuj60012,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        "${e.value.familymemberId?.name} ${e.value.familymemberId?.fathername} ${e.value.familymemberId?.surname}",
                                        style: Styles.black2E363F60014,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      children: [
                                        Padding(
                                          padding: Dimens.edgeInsets20_15_20_15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "શા માટે?:",
                                                    style:
                                                        Styles.grey9393Guj60014,
                                                  ),
                                                  Dimens.boxWidth5,
                                                  Flexible(
                                                    child: Text(
                                                      e.value.foreignerFor ??
                                                          " -- ",
                                                      style:
                                                          Styles.blackGuj60014,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "વિદેશનું નામ:",
                                                    style:
                                                        Styles.grey9393Guj60014,
                                                  ),
                                                  Dimens.boxWidth5,
                                                  Text(
                                                    e.value.country ?? " -- ",
                                                    style: Styles.blackGuj60014,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "શહેરનું નામ:",
                                                    style:
                                                        Styles.grey9393Guj60014,
                                                  ),
                                                  Dimens.boxWidth5,
                                                  Text(
                                                    e.value.city ?? " -- ",
                                                    style: Styles.blackGuj60014,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "યુનિવર્સીટીનું નામ:",
                                                    style:
                                                        Styles.grey9393Guj60014,
                                                  ),
                                                  Dimens.boxWidth5,
                                                  Text(
                                                    e.value.universityName ??
                                                        " -- ",
                                                    style: Styles.blackGuj60014,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "ક્યાં વર્ષથી:",
                                                    style:
                                                        Styles.grey9393Guj60014,
                                                  ),
                                                  Dimens.boxWidth5,
                                                  Text(
                                                    e.value.from.toString(),
                                                    style: Styles.blackGuj60014,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    AssetConstants.ic_call,
                                                  ),
                                                  Dimens.boxWidth10,
                                                  Text(
                                                    "${e.value.mobile?.countryCode} ${e.value.mobile?.number}",
                                                    style:
                                                        Styles.grey9393Guj60014,
                                                  )
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SvgPicture.asset(
                                                          AssetConstants
                                                              .ic_education,
                                                        ),
                                                        Dimens.boxWidth10,
                                                        Flexible(
                                                          child: Text(
                                                            e.value.education
                                                                    ?.gujaratiName ??
                                                                " -- ",
                                                            style: Styles
                                                                .grey9393Guj60014,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: Dimens.one,
                                                    height: Dimens.thirty,
                                                    color: ColorsValue.grey9393,
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Dimens.boxWidth20,
                                                        SvgPicture.asset(
                                                          AssetConstants
                                                              .ic_business,
                                                        ),
                                                        Dimens.boxWidth10,
                                                        Flexible(
                                                          child: Text(
                                                            e.value.business
                                                                    ?.gujaratiName ??
                                                                " -- ",
                                                            style: Styles
                                                                .grey9393Guj60014,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList() ??
                              [],
                        )
                      ],
                    ),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
