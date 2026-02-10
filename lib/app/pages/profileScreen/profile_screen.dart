import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/device/device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
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
                  colorFilter: ColorFilter.mode(
                    ColorsValue.maincolor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            title: Text(
              'profile'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          body: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: Dimens.edgeInsets20_0_20_0,
              children: [
                Dimens.boxHeight87,
                Container(
                  alignment: Alignment.center,
                  height: Dimens.hundredTwenty,
                  width: Dimens.hundredTwenty,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsValue.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimens.twentySix),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimens.twentySix),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: ApiWrapper.imageUrl +
                                (Utility.prifilePic ?? ""),
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
                                AssetConstants.userIcon,
                                height: Dimens.fourHundred,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Dimens.boxHeight14,
                Center(
                  child: Text(
                    "${Utility.profileData?.name} ${Utility.profileData?.fathername} ${Utility.profileData?.surname}",
                    style: Styles.blackGuj60018,
                  ),
                ),
                Dimens.boxHeight2,
                Center(
                  child: Text(
                    "#${Utility.profileData?.userCode}",
                    style: Styles.main60014,
                  ),
                ),
                Dimens.boxHeight49,
                InkWell(
                  onTap: () {
                    RouteManagement.goToHomeScreen();
                  },
                  child: Container(
                    height: Dimens.sixtySix,
                    decoration: BoxDecoration(
                      color: ColorsValue.white,
                      border: Border.all(
                        color: ColorsValue.maincolor,
                        width: Dimens.one,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.six,
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        contentPadding: Dimens.edgeInsets20_00_20_00,
                        dense: true,
                        title: Text(
                          'પ્રોફાઈલ',
                          style: Styles.mainGuj90018,
                        ),
                        trailing:
                            SvgPicture.asset(AssetConstants.ic_arrow_right),
                      ),
                    ),
                  ),
                ),
                // Dimens.boxHeight20,
                // InkWell(
                //   onTap: () {
                //     RouteManagement.goToSelectLanguageScreen();
                //   },
                //   child: Container(
                //     height: Dimens.sixtySix,
                //     decoration: BoxDecoration(
                //       color: ColorsValue.white,
                //       border: Border.all(
                //         color: ColorsValue.maincolor,
                //         width: Dimens.one,
                //       ),
                //       borderRadius: BorderRadius.circular(
                //         Dimens.six,
                //       ),
                //     ),
                //     child: Center(
                //       child: ListTile(
                //         contentPadding: Dimens.edgeInsets20_00_20_00,
                //         dense: true,
                //         title: Text(
                //           'ભાષા',
                //           style: Styles.mainGuj90018,
                //         ),
                //         trailing:
                //             SvgPicture.asset(AssetConstants.ic_arrow_right),
                //       ),
                //     ),
                //   ),
                // ),
                Dimens.boxHeight20,
                InkWell(
                  onTap: () {
                    RouteManagement.goToSabhyFeeRasidScreen();
                  },
                  child: Container(
                    height: Dimens.sixtySix,
                    decoration: BoxDecoration(
                      color: ColorsValue.white,
                      border: Border.all(
                        color: ColorsValue.maincolor,
                        width: Dimens.one,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.six,
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        contentPadding: Dimens.edgeInsets20_00_20_00,
                        dense: true,
                        title: Text(
                          'સભ્ય ફીની રસીદ',
                          style: Styles.mainGuj90018,
                        ),
                        trailing:
                            SvgPicture.asset(AssetConstants.ic_arrow_right),
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                InkWell(
                  onTap: () {
                    Utility.launchLinkURL(
                        "https://sparkflow854.blogspot.com/2026/02/dhakaniya-gam.html");
                  },
                  child: Container(
                    height: Dimens.sixtySix,
                    decoration: BoxDecoration(
                      color: ColorsValue.white,
                      border: Border.all(
                        color: ColorsValue.maincolor,
                        width: Dimens.one,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.six,
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        contentPadding: Dimens.edgeInsets20_00_20_00,
                        dense: true,
                        title: Text(
                          'Privacy Policy',
                          style: Styles.mainGuj90018,
                        ),
                        trailing:
                            SvgPicture.asset(AssetConstants.ic_arrow_right),
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Confirm LogOut",
                            style: Styles.black2E363F50018,
                          ),
                          content: Text(
                            "Are you sure you want to LogOut?",
                            style: Styles.redColor50014,
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "Yes",
                                style: Styles.redColor50014,
                              ),
                              onPressed: () async {Navigator.pop(context);
                                Get.find<DeviceRepository>().deleteBox();
                                RouteManagement.goToLoginScreen();
                              },
                            ),
                            TextButton(
                              child: Text(
                                "No",
                                style: Styles.black2E363F50014,
                              ),
                              onPressed: () {Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: Dimens.sixtySix,
                    decoration: BoxDecoration(
                      color: ColorsValue.white,
                      border: Border.all(
                        color: ColorsValue.maincolor,
                        width: Dimens.one,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.six,
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        contentPadding: Dimens.edgeInsets20_00_20_00,
                        dense: true,
                        title: Text(
                          'લોગ આઉટ',
                          style: Styles.colorD21A0E90018,
                        ),
                        trailing:
                            SvgPicture.asset(AssetConstants.ic_arrow_right),
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
              ],
            ),
          ),
        );
      },
    );
  }
}
