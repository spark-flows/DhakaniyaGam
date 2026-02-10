import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SabhyFeeRasid extends StatelessWidget {
  const SabhyFeeRasid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
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
              child: SvgPicture.asset(AssetConstants.ic_left_arrow),
            ),
          ),
          title: Text('સભ્ય ફીની રસીદ', style: Styles.mainGuj90020),
        ),
        body: SafeArea(
          child: Padding(
            padding: Dimens.edgeInsets20_50_20_0,
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: ColorsValue.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.twelve),
                      ),
                    ),
                    child: Padding(
                      padding: Dimens.edgeInsets20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "શ્રી ઢાંકણીયા ગામ પ્રગતિ મંડળ-સુરત.",
                            style: Styles.color1D1E2070018,
                          ),
                          Dimens.boxHeight20,
                          Row(
                            children: [
                              Padding(
                                padding: Dimens.edgeInsetsLeft20,
                                child: Image.asset(
                                  AssetConstants.app_logo,
                                  width: 70,
                                ),
                              ),
                              Dimens.boxWidth20,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "સભ્ય નોંધણી રસીદ",
                                    style: Styles.color1D1E2060020,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'સભ્ય નં.:',
                                        style: Styles.blackGuj60016,
                                      ),
                                      Text(
                                        " ${Utility.profileData?.userCode}",
                                        style: Styles.color39318560016,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Dimens.boxHeight20,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "મુખ્ય સભ્યનું નામ:",
                                style: Styles.blackGuj50016,
                              ),
                              Dimens.boxWidth20,
                              Flexible(
                                child: Text(
                                  "${Utility.profileData?.name ?? ""} ${Utility.profileData?.fathername ?? ""} ${Utility.profileData?.surname ?? ""}",
                                  style: Styles.color39318570016,
                                ),
                              ),
                            ],
                          ),
                          Dimens.boxHeight12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("સભ્ય ફી:", style: Styles.blackGuj50016),
                              Text("૫૦૦₹", style: Styles.color39318570016),
                            ],
                          ),
                          Dimens.boxHeight12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "પેમેંન્ટ ટાઈપ:",
                                style: Styles.blackGuj50016,
                              ),
                              Text("રોકડા", style: Styles.color39318570016),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //     child: Align(
                //   alignment: Alignment.bottomCenter,
                //   child: CustomButton(onPressed: () {}, text: 'ડાઉનલોડ રસીદ'),
                // )),
                Dimens.boxHeight20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
