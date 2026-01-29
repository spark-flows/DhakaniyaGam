import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DonorsListScreen extends StatelessWidget {
  const DonorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(initState: (state) {
      var controller = Get.find<DashboardController>();
      controller.postDonatorsList();
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.white,
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
            'donors'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20_00_20_00,
          child: Column(
            children: [
              CustomTextFormField(
                text: "",
                hintText: 'Search',
                fillColor: ColorsValue.greyEEEEEE,
                prefixIcon: Padding(
                  padding: Dimens.edgeInsets10,
                  child: SvgPicture.asset(
                    AssetConstants.ic_search,
                  ),
                ),
              ),
              Dimens.boxHeight20,
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.donarList.length,
                  itemBuilder: (context, index) {
                    var item = controller.donarList[index];
                    return InkWell(
                      onTap: () {
                        RouteManagement.goToDonorsDetails(item.id ?? "");
                      },
                      child: Padding(
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
                          child: Center(
                            child: ListTile(
                              contentPadding: Dimens.edgeInsets15_00_15_00,
                              title: Text(
                                item.gujaratiName ?? "",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.mainGuj70018,
                              ),
                              trailing: SvgPicture.asset(
                                AssetConstants.ic_arrow_right,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
