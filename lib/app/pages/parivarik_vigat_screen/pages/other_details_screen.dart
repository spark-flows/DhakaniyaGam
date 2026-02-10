import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OtherDetailsScreen extends StatelessWidget {
  const OtherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParivarikVigatController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.white,
        appBar: AppBar(
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
            'other_details'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: Dimens.edgeInsets20,
          child: CustomButton(
            onPressed: () {
              controller.setProfile();
            },
            text: 'save'.tr,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'building_surat'.tr,
                  style: Styles.grey9BA0A8Guj90016,
                ),
              ),
              Dimens.boxHeight10,
              Row(
                children: [
                  Transform.scale(
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
                        controller.selectedOption = value!;
                        controller.update();
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  Text(
                    'own'.tr,
                    style: controller.selectedOption == 1
                        ? Styles.mainGuj80014
                        : Styles.blackGuj80014,
                  ),
                ],
              ),
              Dimens.boxHeight10,
              Row(
                children: [
                  Transform.scale(
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
                        controller.selectedOption = value!;
                        controller.update();
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  Text(
                    'rent'.tr,
                    style: controller.selectedOption == 2
                        ? Styles.mainGuj80014
                        : Styles.blackGuj80014,
                  ),
                ],
              ),
              Dimens.boxHeight10,
              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Radio<int>(
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: 3,
                      activeColor: ColorsValue.maincolor,
                      groupValue: controller.selectedOption,
                      onChanged: (value) {
                        controller.selectedOption = value!;
                        controller.update();
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  Text(
                    'another_source'.tr,
                    style: controller.selectedOption == 3
                        ? Styles.mainGuj80014
                        : Styles.blackGuj80014,
                  ),
                ],
              ),
              Dimens.boxHeight30,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'other'.tr,
                  style: Styles.grey9BA0A8Guj90016,
                ),
              ),
              Dimens.boxHeight10,
              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: WidgetStatePropertyAll(
                        controller.isMedical
                            ? ColorsValue.maincolor
                            : ColorsValue.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.five),
                      ),
                      side: WidgetStateBorderSide.resolveWith(
                        (states) => BorderSide(
                          width: Dimens.one,
                          color: ColorsValue.maincolor,
                        ),
                      ),
                      value: controller.isMedical,
                      activeColor: ColorsValue.maincolor,
                      checkColor: ColorsValue.white,
                      onChanged: (value) {
                        controller.isMedical = value!;
                        if (value) {
                          controller.mediclaimList.add("મેડિકલેઇમ");
                        } else {
                          controller.mediclaimList.remove("મેડિકલેઇમ");
                        }
                        controller.update();
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  Text(
                    'medical'.tr,
                    style: controller.isMedical
                        ? Styles.mainGuj80014
                        : Styles.blackGuj80014,
                  ),
                ],
              ),
              Dimens.boxHeight10,
              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: WidgetStatePropertyAll(
                        controller.isAyushmanCard
                            ? ColorsValue.maincolor
                            : ColorsValue.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.five),
                      ),
                      side: WidgetStateBorderSide.resolveWith(
                        (states) => BorderSide(
                          width: Dimens.one,
                          color: ColorsValue.maincolor,
                        ),
                      ),
                      value: controller.isAyushmanCard,
                      activeColor: ColorsValue.maincolor,
                      checkColor: ColorsValue.white,
                      onChanged: (value) {
                        controller.isAyushmanCard = value!;
                        if (value) {
                          controller.mediclaimList.add("આયુષ્માન કાર્ડ");
                        } else {
                          controller.mediclaimList.remove("આયુષ્માન કાર્ડ");
                        }
                        controller.update();
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  Text(
                    'ayushman_card'.tr,
                    style: controller.isAyushmanCard
                        ? Styles.mainGuj80014
                        : Styles.blackGuj80014,
                  ),
                ],
              ),
              Dimens.boxHeight10,
              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fillColor: WidgetStatePropertyAll(
                        controller.isInsurance
                            ? ColorsValue.maincolor
                            : ColorsValue.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.five),
                      ),
                      side: WidgetStateBorderSide.resolveWith(
                        (states) => BorderSide(
                          width: Dimens.one,
                          color: ColorsValue.maincolor,
                        ),
                      ),
                      value: controller.isInsurance,
                      activeColor: ColorsValue.maincolor,
                      checkColor: ColorsValue.white,
                      onChanged: (value) {
                        controller.isInsurance = value!;
                        if (value) {
                          controller.mediclaimList
                              .add("પ્રધાનમંત્રી જીવન વીમા યોજના");
                        } else {
                          controller.mediclaimList
                              .remove("પ્રધાનમંત્રી જીવન વીમા યોજના");
                        }
                        controller.update();
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  Text(
                    'pradhan_mantri_insurance'.tr,
                    style: controller.isInsurance
                        ? Styles.mainGuj80014
                        : Styles.blackGuj80014,
                  ),
                ],
              ),
              Dimens.boxHeight30,
              CustomTextFormField(
                fillColor: ColorsValue.greyEEEEEE,
                text: 'special_talent'.tr,
                isGujarati: true,
                textInputAction: TextInputAction.next,
                controller: controller.talentController,
              ),
            ],
          ),
        ),
      );
    });
  }
}
