import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddKhetiVigatScreen extends StatelessWidget {
  const AddKhetiVigatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      builder: (controller) => Scaffold(
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
                    if (controller.agriculturalLandController.text.isNotEmpty) {
                      controller.postLoanApply();
                    }
                  },
                  text: 'confrim'.tr,
                  backGroundColor: ColorsValue.maincolor,
                ),
              ),
            ],
          ),
        ),
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
            'details_agricultural_land'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: SafeArea(
            child: ListView(
          padding: Dimens.edgeInsets20_30_20_0,
          children: [
            CustomTextFormField(
              controller: controller.agriculturalLandController,
              fillColor: ColorsValue.greyEEEEEE,
              text: 'area_​​agricultural_land'.tr,
              isGujarati: true,
              textInputAction: TextInputAction.next,
              keybordtype: TextInputType.number,
              validation: (p0) {
                if (p0!.isEmpty) {
                  return 'ખેતીની જમીનનું ક્ષેત્રફળ(વિઘામાં) દાખલ કરો';
                }
                return null;
              },
            ),
          ],
        )),
      ),
    );
  }
}
