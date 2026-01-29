import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddKamataSabhyScreen extends StatelessWidget {
  const AddKamataSabhyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
      initState: (state) {
        var controller = Get.find<SevaoController>();
        controller.businessCategoriesApi();
      },
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
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: Dimens.edgeInsets12,
                child: SvgPicture.asset(
                  AssetConstants.ic_left_arrow,
                ),
              ),
            ),
            title: Text(
              'family_earning_detail'.tr,
              style: Styles.mainGuj90020,
            ),
          ),
          body: Form(
            key: controller.kutumbKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Padding(
                padding: Dimens.edgeInsets20_30_20_0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'member_name'.tr,
                        style: Styles.grey9BA0A8Guj90016,
                      ),
                    ),
                    Container(
                      height: Dimens.fifty,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.six),
                        color: ColorsValue.greyEEEEEE,
                      ),
                      child: DropdownButton<String>(
                        underline: Container(),
                        hint: Text(
                          'member_name'.tr,
                          style: Styles.grey9BA0A8Guj90016,
                        ),
                        padding: EdgeInsets.only(
                          left: Dimens.ten,
                          right: Dimens.ten,
                        ),
                        isExpanded: true,
                        icon: SvgPicture.asset(
                          AssetConstants.ic_down_arrow,
                        ),
                        value: controller.selectKutumbValue,
                        items: controller.selectKutumbLists
                            .map((value) => DropdownMenuItem(
                                  onTap: () {
                                    controller.relation = value.relation ?? "";
                                    controller.kutumMemberName =
                                        "${value.name} ${value.fathername} ${value.surname}";
                                    controller.update();
                                  },
                                  value: value.id,
                                  child: Text(
                                      "${value.name ?? "Select Member"} ${value.fathername ?? ""} ${value.surname ?? ""}"),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          controller.selectKutumbValue = newValue;
                          controller.update();
                        },
                      ),
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.businessLoanController,
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'business'.tr,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'dob'.tr,
                      readOnly: true,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                      controller: controller.dobFamilyController,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'enter_dob'.tr;
                        }
                        return null;
                      },
                      suffixIcon: InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: ColorsValue.maincolor,
                                    onPrimary: ColorsValue.white,
                                    onSurface: ColorsValue.maincolor,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: ColorsValue.maincolor,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            context: context,
                            initialDate: controller.selectedFamilyDate,
                            firstDate: DateTime(1920),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null &&
                              picked != controller.selectedFamilyDate) {
                            controller.selectedFamilyDate = picked;

                            controller.dobFamilyController.text =
                                DateFormat("dd-MM-yyyy")
                                    .format(controller.selectedFamilyDate);
                            controller.selectDobDate =
                                Utility.dateYYYYMMDD(picked);
                            controller.ageFamilyController.text =
                                controller.calculateAge(
                                    controller.dobFamilyController.text);
                            controller.update();
                          }
                        },
                        child: Padding(
                          padding: Dimens.edgeInsets10,
                          child: SvgPicture.asset(
                            AssetConstants.ic_calendar,
                          ),
                        ),
                      ),
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.ageFamilyController,
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'age'.tr,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                    ),
                    Dimens.boxHeight20,
                    CustomTextFormField(
                      controller: controller.enualIncomeController,
                      fillColor: ColorsValue.greyEEEEEE,
                      text: 'annual_income'.tr,
                      isGujarati: true,
                      textInputAction: TextInputAction.next,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'વાર્ષિક આવક દાખલ કરો';
                        }
                        return null;
                      },
                    ),
                    Dimens.boxHeight50,
                    CustomButton(
                      onPressed: () async {
                        controller.addNote();
                        Get.back();
                        controller.update();
                      },
                      text: 'સબમિટ કરો',
                    ),
                    Dimens.boxHeight30,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
