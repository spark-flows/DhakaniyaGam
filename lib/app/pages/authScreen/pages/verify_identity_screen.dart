import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyIdentityScreen extends StatelessWidget {
  const VerifyIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.white,
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetConstants.ic_verify_svg,
                ),
                Dimens.boxHeight50,
                Text(
                  "Verify Your Identity",
                  style: Styles.main70030,
                ),
                Dimens.boxHeight10,
                Text(
                  "Your mobile number +91 ******3515 has gone to admin for approval.",
                  style: Styles.grey9BA0A850014,
                  textAlign: TextAlign.center,
                ),
                Dimens.boxHeight80,
                ElevatedButton(
                  onPressed:
                      Get.find<Repository>().getBoolValue(LocalKeys.isApproved)
                          ? () {
                              RouteManagement.goToBottomBarScreen();
                            }
                          : () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      double.maxFinite,
                      Dimens.fifty,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.five),
                    ),
                    backgroundColor: Get.find<Repository>()
                            .getBoolValue(LocalKeys.isApproved)
                        ? ColorsValue.maincolor
                        : ColorsValue.maincolor.withOpacity(0.5),
                  ),
                  child: Text(
                    "Get Started",
                    style: Styles.whiteFFFBD670018,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
