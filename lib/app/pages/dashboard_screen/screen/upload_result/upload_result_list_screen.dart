import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UploadResultListScreen extends StatelessWidget {
  const UploadResultListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      initState: (state) {
        var controller = Get.find<DashboardController>();
        controller.getAllResult();
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
              'upload_the_result'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: ColorsValue.maincolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimens.thirty,
              ),
            ),
            onPressed: () {
              RouteManagement.goToUploadResultScreen();
            },
            icon: SvgPicture.asset(
              AssetConstants.ic_upload,
            ),
            label: Text(
              "upload".tr,
              style: Styles.whiteGuj70018,
            ),
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: controller.getResultList.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.getResultList.length,
                    itemBuilder: (context, index) {
                      var item = controller.getResultList[index];
                      return Padding(
                        padding: Dimens.edgeInsets00_10_00_10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              Dimens.six,
                            ),
                            border: Border.all(
                              color: ColorsValue.maincolor,
                              width: Dimens.one,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: Dimens.edgeInsets20_15_20_10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${item.familymember?.name} ${item.familymember?.fathername} ${item.familymember?.surname}",
                                      style: Styles.blackGuj60018,
                                    ),
                                    Text(
                                      item.action == "approved"
                                          ? "સ્વીકાર્ય"
                                          : item.action == "rejected"
                                              ? "રિજેક્ટ"
                                              : "પેન્ડિંગ",
                                      style: item.action == "approved"
                                          ? Styles.greenGuj60012
                                          : item.action == "rejected"
                                              ? Styles.redGuj60012
                                              : Styles.orangeGuj60012,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: Dimens.edgeInsets20_05_20_05,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: Dimens.thirtyTwo,
                                      padding: Dimens.edgeInsets05_00_05_00,
                                      decoration: BoxDecoration(
                                        color: ColorsValue.lightMainColor,
                                        borderRadius: BorderRadius.circular(
                                          Dimens.six,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          item.education ?? "",
                                          style: Styles.mainGuj60016,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      Utility.getTimeStempToDate(
                                          item.createTimestamp),
                                      style: Styles.grey9393Guj60012,
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                height: Dimens.one,
                                color: ColorsValue.greyDDDD,
                              ),
                              Padding(
                                padding: Dimens.edgeInsets20_05_20_05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: item.prize ?? false
                                            ? () {
                                                // showDialog(
                                                //   context: context,
                                                //   builder: (context) {
                                                //     return StatefulBuilder(
                                                //       builder: (context, setState) {
                                                //         return Column(
                                                //           mainAxisSize: MainAxisSize.min,
                                                //           mainAxisAlignment:
                                                //               MainAxisAlignment.center,
                                                //           children: [
                                                //             Padding(
                                                //               padding: Dimens.edgeInsets20,
                                                //               child: Container(
                                                //                 padding:
                                                //                     Dimens.edgeInsets20,
                                                //                 decoration: BoxDecoration(
                                                //                   color: ColorsValue.white,
                                                //                   borderRadius:
                                                //                       BorderRadius.circular(
                                                //                     Dimens.twelve,
                                                //                   ),
                                                //                 ),
                                                //                 child: Column(
                                                //                   crossAxisAlignment:
                                                //                       CrossAxisAlignment
                                                //                           .start,
                                                //                   mainAxisSize:
                                                //                       MainAxisSize.min,
                                                //                   children: [
                                                //                     Text(
                                                //                       "શ્રી ધંધુકા તાલુકા પટેલ પ્રગતિ મંડળ-સુરત.",
                                                //                       style: Styles
                                                //                           .blackGuj70018,
                                                //                     ),
                                                //                     Dimens.boxHeight20,
                                                //                     Row(
                                                //                       children: [
                                                //                         Image.asset(
                                                //                           AssetConstants
                                                //                               .app_logo,
                                                //                           height: Dimens
                                                //                               .fiftySeven,
                                                //                           width: Dimens
                                                //                               .eightyFour,
                                                //                         ),
                                                //                         Dimens.boxWidth10,
                                                //                         Column(
                                                //                           crossAxisAlignment:
                                                //                               CrossAxisAlignment
                                                //                                   .start,
                                                //                           children: [
                                                //                             Text(
                                                //                               "ઇનામ વિતરણ કુપન",
                                                //                               style: Styles
                                                //                                   .blackGuj60020,
                                                //                             ),
                                                //                             Row(
                                                //                               children: [
                                                //                                 Text(
                                                //                                   "કુપન નં.: ",
                                                //                                   style: Styles
                                                //                                       .blackGuj60016,
                                                //                                 ),
                                                //                                 Text(
                                                //                                   "8596",
                                                //                                   style: Styles
                                                //                                       .mainGuj60016,
                                                //                                 ),
                                                //                               ],
                                                //                             )
                                                //                           ],
                                                //                         )
                                                //                       ],
                                                //                     ),
                                                //                     Dimens.boxHeight20,
                                                //                     Row(
                                                //                       mainAxisAlignment:
                                                //                           MainAxisAlignment
                                                //                               .spaceBetween,
                                                //                       children: [
                                                //                         Text(
                                                //                           "સભ્યનું નામ:",
                                                //                           style: Styles
                                                //                               .blackGuj50016,
                                                //                         ),
                                                //                         Text(
                                                //                           item.familymember
                                                //                                   ?.name ??
                                                //                               " -- ",
                                                //                           style: Styles
                                                //                               .mainGuj50016,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                     Dimens.boxHeight10,
                                                //                     Row(
                                                //                       mainAxisAlignment:
                                                //                           MainAxisAlignment
                                                //                               .spaceBetween,
                                                //                       children: [
                                                //                         Text(
                                                //                           "વિદ્યાર્થીનું નામ:",
                                                //                           style: Styles
                                                //                               .blackGuj50016,
                                                //                         ),
                                                //                         Text(
                                                //                           item.familymember
                                                //                                   ?.name ??
                                                //                               " -- ",
                                                //                           style: Styles
                                                //                               .mainGuj50016,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                     Dimens.boxHeight10,
                                                //                     Row(
                                                //                       mainAxisAlignment:
                                                //                           MainAxisAlignment
                                                //                               .spaceBetween,
                                                //                       children: [
                                                //                         Text(
                                                //                           "પાસ કરેલ ધોરણ:",
                                                //                           style: Styles
                                                //                               .blackGuj50016,
                                                //                         ),
                                                //                         Text(
                                                //                           "09",
                                                //                           style: Styles
                                                //                               .mainGuj50016,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                     Dimens.boxHeight10,
                                                //                     Row(
                                                //                       mainAxisAlignment:
                                                //                           MainAxisAlignment
                                                //                               .spaceBetween,
                                                //                       children: [
                                                //                         Text(
                                                //                           "ટકા:",
                                                //                           style: Styles
                                                //                               .blackGuj50016,
                                                //                         ),
                                                //                         Text(
                                                //                           "95.02%",
                                                //                           style: Styles
                                                //                               .mainGuj50016,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                     // Dimens.boxHeight30,
                                                //                     // Row(
                                                //                     //   children:
                                                //                     //       List.generate(
                                                //                     //           150 ~/ 2,
                                                //                     //           (index) =>
                                                //                     //               Expanded(
                                                //                     //                 child:
                                                //                     //                     Container(
                                                //                     //                   color: index % 2 == 0
                                                //                     //                       ? Colors.transparent
                                                //                     //                       : ColorsValue.grey9BA0A8,
                                                //                     //                   height:
                                                //                     //                       Dimens.one,
                                                //                     //                 ),
                                                //                     //               )),
                                                //                     // ),
                                                //                     // Dimens.boxHeight30,
                                                //                     // Center(
                                                //                     //   child: Container(
                                                //                     //     height:
                                                //                     //         Dimens.ninty,
                                                //                     //     width: Dimens.ninty,
                                                //                     //     decoration:
                                                //                     //         BoxDecoration(
                                                //                     //       color:
                                                //                     //           Colors.black,
                                                //                     //       borderRadius:
                                                //                     //           BorderRadius
                                                //                     //               .circular(
                                                //                     //         Dimens.ten,
                                                //                     //       ),
                                                //                     //     ),
                                                //                     //   ),
                                                //                     // )
                                                //                   ],
                                                //                 ),
                                                //               ),
                                                //             ),
                                                //           ],
                                                //         );
                                                //       },
                                                //     );
                                                //   },
                                                // );
                                                controller.postDownloadPrize(
                                                    item.id ?? "");
                                              }
                                            : null,
                                        child: Center(
                                          child: Text(
                                            "download_coupon".tr,
                                            style: Styles.redD4363AGuj70012,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: Dimens.one,
                                      height: Dimens.twentyTwo,
                                      color: ColorsValue.greyDDDD,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: item.stationery ?? false
                                            ? () async {
                                                // showDialog(
                                                //   context: context,
                                                //   builder: (context) {
                                                //     return StatefulBuilder(
                                                //       builder: (context, setState) {
                                                //         return Column(
                                                //           mainAxisSize:
                                                //               MainAxisSize.min,
                                                //           mainAxisAlignment:
                                                //               MainAxisAlignment
                                                //                   .center,
                                                //           children: [
                                                //             Padding(
                                                //               padding:
                                                //                   Dimens.edgeInsets20,
                                                //               child: Container(
                                                //                 padding: Dimens
                                                //                     .edgeInsets20,
                                                //                 decoration:
                                                //                     BoxDecoration(
                                                //                   color: ColorsValue
                                                //                       .white,
                                                //                   borderRadius:
                                                //                       BorderRadius
                                                //                           .circular(
                                                //                     Dimens.twelve,
                                                //                   ),
                                                //                 ),
                                                //                 child: Column(
                                                //                   crossAxisAlignment:
                                                //                       CrossAxisAlignment
                                                //                           .start,
                                                //                   mainAxisSize:
                                                //                       MainAxisSize
                                                //                           .min,
                                                //                   children: [
                                                //                     Text(
                                                //                       "શ્રી બૃહદ ધંધુકા તાલુકા પટેલ પ્રગતિ મંડળ-સુરત.",
                                                //                       style: Styles
                                                //                           .blackGuj70018,
                                                //                     ),
                                                //                     Dimens
                                                //                         .boxHeight20,
                                                //                     Row(
                                                //                       children: [
                                                //                         Image.asset(
                                                //                           AssetConstants
                                                //                               .app_logo,
                                                //                           height: Dimens
                                                //                               .fiftySeven,
                                                //                           width: Dimens
                                                //                               .eightyFour,
                                                //                         ),
                                                //                         Dimens
                                                //                             .boxWidth10,
                                                //                         Column(
                                                //                           crossAxisAlignment:
                                                //                               CrossAxisAlignment
                                                //                                   .start,
                                                //                           children: [
                                                //                             Text(
                                                //                               "નોટબુક વિતરણ કુપન",
                                                //                               style: Styles
                                                //                                   .blackGuj60020,
                                                //                             ),
                                                //                             Row(
                                                //                               children: [
                                                //                                 Text(
                                                //                                   "કુપન નં.: ",
                                                //                                   style:
                                                //                                       Styles.blackGuj60016,
                                                //                                 ),
                                                //                                 Text(
                                                //                                   "8596",
                                                //                                   style:
                                                //                                       Styles.mainGuj60016,
                                                //                                 ),
                                                //                               ],
                                                //                             )
                                                //                           ],
                                                //                         )
                                                //                       ],
                                                //                     ),
                                                //                     Dimens
                                                //                         .boxHeight20,
                                                //                     Row(
                                                //                       mainAxisAlignment:
                                                //                           MainAxisAlignment
                                                //                               .spaceBetween,
                                                //                       children: [
                                                //                         Text(
                                                //                           "સભ્યનું નામ:",
                                                //                           style: Styles
                                                //                               .blackGuj50016,
                                                //                         ),
                                                //                         Text(
                                                //                           "ધનજી આર. પટેલ",
                                                //                           style: Styles
                                                //                               .mainGuj50016,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                     Dimens
                                                //                         .boxHeight10,
                                                //                     Row(
                                                //                       mainAxisAlignment:
                                                //                           MainAxisAlignment
                                                //                               .spaceBetween,
                                                //                       children: [
                                                //                         Text(
                                                //                           "વિદ્યાર્થીનું નામ:",
                                                //                           style: Styles
                                                //                               .blackGuj50016,
                                                //                         ),
                                                //                         Text(
                                                //                           "ધનજી આર. પટેલ",
                                                //                           style: Styles
                                                //                               .mainGuj50016,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                     Dimens
                                                //                         .boxHeight10,
                                                //                     Row(
                                                //                       mainAxisAlignment:
                                                //                           MainAxisAlignment
                                                //                               .spaceBetween,
                                                //                       children: [
                                                //                         Text(
                                                //                           "વિદ્યાર્થીનું નવું ધોરણ:",
                                                //                           style: Styles
                                                //                               .blackGuj50016,
                                                //                         ),
                                                //                         Text(
                                                //                           "09",
                                                //                           style: Styles
                                                //                               .mainGuj50016,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                     Dimens
                                                //                         .boxHeight10,
                                                //                     Row(
                                                //                       mainAxisAlignment:
                                                //                           MainAxisAlignment
                                                //                               .spaceBetween,
                                                //                       children: [
                                                //                         Text(
                                                //                           "ગામ:",
                                                //                           style: Styles
                                                //                               .blackGuj50016,
                                                //                         ),
                                                //                         Text(
                                                //                           "ધંધુકા",
                                                //                           style: Styles
                                                //                               .mainGuj50016,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                     // Dimens.boxHeight30,
                                                //                     // Row(
                                                //                     //   children:
                                                //                     //       List.generate(
                                                //                     //           150 ~/ 2,
                                                //                     //           (index) =>
                                                //                     //               Expanded(
                                                //                     //                 child:
                                                //                     //                     Container(
                                                //                     //                   color: index % 2 == 0
                                                //                     //                       ? Colors.transparent
                                                //                     //                       : ColorsValue.grey9BA0A8,
                                                //                     //                   height:
                                                //                     //                       Dimens.one,
                                                //                     //                 ),
                                                //                     //               )),
                                                //                     // ),
                                                //                     // Dimens.boxHeight30,
                                                //                     // Center(
                                                //                     //   child: Container(
                                                //                     //     height:
                                                //                     //         Dimens.ninty,
                                                //                     //     width: Dimens.ninty,
                                                //                     //     decoration:
                                                //                     //         BoxDecoration(
                                                //                     //       color:
                                                //                     //           Colors.black,
                                                //                     //       borderRadius:
                                                //                     //           BorderRadius
                                                //                     //               .circular(
                                                //                     //         Dimens.ten,
                                                //                     //       ),
                                                //                     //     ),
                                                //                     //   ),
                                                //                     // )
                                                //                   ],
                                                //                 ),
                                                //               ),
                                                //             ),
                                                //           ],
                                                //         );
                                                //       },
                                                //     );
                                                //   },
                                                // );
                                              }
                                            : null,
                                        child: Center(
                                          child: Text(
                                            "download_stationery_coupons".tr,
                                            style: Styles.redD4363AGuj70012,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "${"upload_the_result".tr} ડેટા મળ્યો નથી...!",
                      style: Styles.blackGuj60014,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
