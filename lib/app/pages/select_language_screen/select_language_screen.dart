import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/domain/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectLanguageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.white,
        bottomNavigationBar: Padding(
          padding: Dimens.edgeInsets20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                elevation: Dimens.five,
                color: ColorsValue.white,
                child: Center(
                  child: ListTile(
                    onTap: () {
                      controller.selectedOption = 1;
                      controller.update();
                    },
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    leading: Text(
                      'english'.tr,
                      style: Styles.main60018,
                    ),
                    trailing: Transform.scale(
                      scale: 1.2,
                      child: Radio<int>(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: 1,
                        activeColor: ColorsValue.maincolor,
                        groupValue: controller.selectedOption,
                        onChanged: (value) {
                          controller.selectedOption = 1;
                          controller.update();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Dimens.boxHeight20,
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                elevation: Dimens.five,
                color: ColorsValue.white,
                child: Center(
                  child: ListTile(
                    onTap: () {
                      controller.selectedOption = 2;
                      controller.update();
                    },
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    leading: Text(
                      'gujarati'.tr,
                      style: Styles.main60018,
                    ),
                    trailing: Transform.scale(
                      scale: 1.2,
                      child: Radio<int>(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: 2,
                        activeColor: ColorsValue.maincolor,
                        groupValue: controller.selectedOption,
                        onChanged: (value) {
                          controller.selectedOption = 2;
                          controller.update();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Dimens.boxHeight20,
              CustomButton(
                onPressed: () {
                  var locale;
                  if (controller.selectedOption == 1) {
                    locale = Locale('en', 'US');
                    Get.find<Repository>().saveValue(LocalKeys.language, 'en');
                  } else {
                    locale = Locale('gu', 'IN');
                    Get.find<Repository>().saveValue(LocalKeys.language, 'gu');
                  }
                  Get.updateLocale(locale);
                  RouteManagement.goToIntroFirstScreen();
                },
                text: 'Continue'.tr,
              )
            ],
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dimens.boxHeight30,
              Center(
                child: Text(
                  'select_language'.tr,
                  style: Styles.main70030,
                ),
              ),
              Dimens.boxHeight5,
              Center(
                child: Text(
                  'select_your_language'.tr,
                  style: Styles.grey9BA0A850014,
                ),
              ),
              Image.asset(
                AssetConstants.ic_language,
              )
            ],
          ),
        ),
      );
    });
  }
}
