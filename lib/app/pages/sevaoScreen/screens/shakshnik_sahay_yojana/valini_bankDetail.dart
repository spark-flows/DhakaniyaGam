import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ValiNiBankDetailScreen extends StatelessWidget {
  const ValiNiBankDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(
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
              child: SvgPicture.asset(
                AssetConstants.ic_left_arrow,
              ),
            ),
          ),
          title: Text(
            'વાલીના બેંક ખાતાની વિગત',
            style: Styles.mainGuj90020,
          ),
        ),
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
                    RouteManagement.goToBhalamanKarnarScreen();
                  },
                  text: 'move_on'.tr,
                  backGroundColor: ColorsValue.maincolor,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: Dimens.edgeInsets20_30_20_0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller.bankNameController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'bank_name'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    controller: controller.accountController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'account_number'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    controller: controller.branchController,
                    fillColor: ColorsValue.greyEEEEEE,
                    text: 'branch'.tr,
                    isGujarati: true,
                    textInputAction: TextInputAction.next,
                  ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'passbook_photo'.tr,
                      style: Styles.grey9BA0A8Guj90016,
                    ),
                  ),
                  Card(
                    elevation: 2,
                    color: ColorsValue.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UploadWidgets(
                          height: Dimens.fourtyFive,
                          txt: 'add_photo'.tr,
                          onTap: () {
                            controller.uploadPassbook(ImageSource.gallery);
                          },
                          bgColor: ColorsValue.white,
                          svgPicture: AssetConstants.ic_photo,
                        ),
                        Visibility(
                          visible: controller.paasbookPic?.isNotEmpty ?? false,
                          child: CachedNetworkImage(
                            imageUrl: ApiWrapper.imageUrl +
                                (controller.paasbookPic ?? ""),
                            height: Dimens.twoHundred,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            maxHeightDiskCache: 300,
                            maxWidthDiskCache: 300,
                            placeholder: (context, index) {
                              return Image.asset(
                                AssetConstants.app_logo,
                                fit: BoxFit.cover,
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                AssetConstants.app_logo,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
