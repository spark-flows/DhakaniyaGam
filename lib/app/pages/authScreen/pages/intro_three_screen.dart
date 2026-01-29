import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroThreeScreen extends StatelessWidget {
  const IntroThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.white,
        bottomNavigationBar: Padding(
          padding: Dimens.edgeInsets20,
          child: CustomButton(
            onPressed: () async {
              var token = await Get.find<Repository>()
                  .getStringValue(LocalKeys.authToken);
              if (token.isNotEmpty) {
                RouteManagement.goToBottomBarScreen();
              } else {
                RouteManagement.goToLoginScreen();
              }
            },
            text: 'continue'.tr,
          ),
        ),
        body: ListView(
          padding: Dimens.edgeInsets20_50_20_00,
          children: [
            Text(
              "શ્રી બૃહદ ધંધુકા તાલુકા પટેલ પ્રગતિ મંડળ-સુરત.",
              textAlign: TextAlign.center,
              style: Styles.mainGuj80018,
            ),
            Dimens.boxHeight20,
            Text(
              "ડિજીટલ સોવેનિયર ૨૦૨૪ ના દાતાશ્રી",
              textAlign: TextAlign.center,
              style: Styles.mainGuj90022,
            ),
            Dimens.boxHeight20,
            ClipRRect(
                borderRadius: BorderRadius.circular(
                  Dimens.twelve,
                ),
                child: Image.asset(AssetConstants.indro_img)),
          ],
        ),
      );
    });
  }
}
