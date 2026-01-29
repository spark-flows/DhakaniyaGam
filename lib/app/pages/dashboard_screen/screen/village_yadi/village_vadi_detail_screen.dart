import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class VillageYadiDetailScreen extends StatelessWidget {
  const VillageYadiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);

    return GetBuilder<DashboardController>(initState: (state) {
      var controller = Get.find<DashboardController>();
      controller.villageId = Get.arguments[0] ?? "";
      controller.villageName = Get.arguments[1] ?? "";
      controller.searchVillageYadiController.clear();
      controller.pagingVillageCommitteeController =
          PagingController(firstPageKey: 1);
      controller.pagingVillageCommitteeController
          .addPageRequestListener((pageKey) async {
        await controller.getAllUsersVillage(pageKey);
      });
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.twenty),
              bottomRight: Radius.circular(Dimens.twenty),
            ),
          ),
          backgroundColor: Colors.white,
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
            controller.villageName ?? "",
            style: Styles.mainGuj90020,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20_00_20_00,
          child: ListView(
            shrinkWrap: true,
            children: [
              if (controller.villageName == "ભીમનાથ") ...[
                Dimens.boxHeight20,
                SizedBox(
                  height: Dimens.hundredEighty,
                  child: PageView.builder(
                    itemCount: controller.villageImgList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          RouteManagement.goToShowFullScareenImage(
                              controller.villageImgList[index] ?? "", "IMG");
                        },
                        child: Padding(
                          padding: Dimens.edgeInsets00_10_00_30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Dimens.six),
                            child: Image.asset(
                              controller.villageImgList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: controller.searchVillageYadiController,
                      text: "",
                      hintText: 'Search',
                      fillColor: ColorsValue.greyEEEEEE,
                      prefixIcon: Padding(
                        padding: Dimens.edgeInsets10,
                        child: SvgPicture.asset(
                          AssetConstants.ic_search,
                        ),
                      ),
                      onChanged: (value) {
                        _debouncer.run(() {
                          Future.sync(
                            () {
                              return controller.pagingVillageCommitteeController
                                  .refresh();
                            },
                          );
                        });
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: ColorsValue.white,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding: Dimens.edgeInsets20_30_20_30,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Text(
                                      'filter'.tr,
                                      style: Styles.mainGuj90020,
                                    ),
                                    Dimens.boxHeight10,
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'business_name'.tr,
                                        style: Styles.grey9BA0A8Guj90016,
                                      ),
                                    ),
                                    Container(
                                      height: Dimens.fifty,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(Dimens.six),
                                          color: ColorsValue.greyEEEEEE),
                                      child: DropdownButton<String>(
                                        underline: Container(),
                                        hint: Text(
                                          'business_name'.tr,
                                          style: Styles.grey9BA0A8Guj90016,
                                        ),
                                        padding: EdgeInsets.only(
                                            left: Dimens.ten,
                                            right: Dimens.ten),
                                        isExpanded: true,
                                        icon: SvgPicture.asset(
                                            AssetConstants.ic_down_arrow),
                                        value: controller.selectBusinessValue,
                                        items: controller.selectBusinessLists
                                            .map((value) => DropdownMenuItem(
                                                  value: value.id,
                                                  child: Text(
                                                      value.gujaratiName ?? ''),
                                                ))
                                            .toList(),
                                        onChanged: (newValue) {
                                          controller.selectBusinessValue =
                                              newValue;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    Dimens.boxHeight20,
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Study'.tr,
                                        style: Styles.grey9BA0A8Guj90016,
                                      ),
                                    ),
                                    Container(
                                      height: Dimens.fifty,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(Dimens.six),
                                          color: ColorsValue.greyEEEEEE),
                                      child: DropdownButton<String>(
                                        underline: Container(),
                                        hint: Text(
                                          'Study'.tr,
                                          style: Styles.grey9BA0A8Guj90016,
                                        ),
                                        padding: EdgeInsets.only(
                                            left: Dimens.ten,
                                            right: Dimens.ten),
                                        isExpanded: true,
                                        icon: SvgPicture.asset(
                                            AssetConstants.ic_down_arrow),
                                        value: controller.selectStudyValue,
                                        items: controller.selectStudyLists
                                            .map((value) => DropdownMenuItem(
                                                  value: value.id,
                                                  child: Text(
                                                      value.gujaratiName ?? ''),
                                                ))
                                            .toList(),
                                        onChanged: (newValue) {
                                          controller.selectStudyValue =
                                              newValue;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    Dimens.boxHeight20,
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'blood_group'.tr,
                                        style: Styles.grey9BA0A8Guj90016,
                                      ),
                                    ),
                                    Container(
                                      height: Dimens.fifty,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(Dimens.six),
                                          color: ColorsValue.greyEEEEEE),
                                      child: DropdownButton<String>(
                                        underline: Container(),
                                        hint: Text(
                                          'blood_group'.tr,
                                          style: Styles.grey9BA0A8Guj90016,
                                        ),
                                        padding: EdgeInsets.only(
                                            left: Dimens.ten,
                                            right: Dimens.ten),
                                        isExpanded: true,
                                        icon: SvgPicture.asset(
                                            AssetConstants.ic_down_arrow),
                                        value: controller.selectBloodValue,
                                        items: controller.bloodGroup
                                            .map(
                                              (value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (newValue) {
                                          controller.selectBloodValue =
                                              newValue ?? "";
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    Dimens.boxHeight20,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.selectBusinessValue =
                                                  "";
                                              controller.selectStudyValue = "";
                                              controller.selectBloodValue =
                                                  "Select BloodGroup";
                                              controller
                                                  .pagingVillageCommitteeController
                                                  .refresh();
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(
                                                double.infinity,
                                                Dimens.fifty,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimens.five),
                                              ),
                                              backgroundColor:
                                                  ColorsValue.lightMainColor,
                                            ),
                                            child: Text(
                                              "cancle".tr,
                                              style: Styles.mainGuj70018,
                                            ),
                                          ),
                                        ),
                                        Dimens.boxWidth20,
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                              controller
                                                  .pagingVillageCommitteeController
                                                  .refresh();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(
                                                double.infinity,
                                                Dimens.fifty,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimens.five),
                                              ),
                                              backgroundColor:
                                                  ColorsValue.maincolor,
                                            ),
                                            child: Text(
                                              "apply".tr,
                                              style: Styles.whiteGuj70018,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: Dimens.edgeInsetsTop30,
                      width: Dimens.fifty,
                      height: Dimens.fourtySix,
                      decoration: BoxDecoration(
                        color: ColorsValue.maincolor,
                        borderRadius: BorderRadius.circular(Dimens.five),
                      ),
                      child: Padding(
                        padding: Dimens.edgeInsets10,
                        child: SvgPicture.asset(
                          AssetConstants.ic_filter,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Dimens.boxHeight20,
              RefreshIndicator(
                onRefresh: () => Future.sync(
                  () => controller.pagingVillageCommitteeController.refresh(),
                ),
                child: PagedListView<int, GetAllUsersDoc>(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  pagingController: controller.pagingVillageCommitteeController,
                  builderDelegate: PagedChildBuilderDelegate<GetAllUsersDoc>(
                    noItemsFoundIndicatorBuilder: (_) {
                      return Container(
                        height: Get.width,
                        child: Center(
                          child: Text(
                            "Data Not Found...!",
                            style: Styles.main60018,
                          ),
                        ),
                      );
                    },
                    itemBuilder: (context, item, index) {
                      return InkWell(
                        onTap: () {
                          RouteManagement.goToSabhayYadiDeatilsScreen(
                              item.id ?? "");
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
                                leading: Container(
                                  height: Dimens.fifty,
                                  width: Dimens.fifty,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.hundred,
                                    ),
                                    color: ColorsValue.maincolor,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.hundred),
                                    child: CachedNetworkImage(
                                      imageUrl: ApiWrapper.imageUrl +
                                          (item.profilePic ?? ""),
                                      fit: BoxFit.cover,
                                      maxHeightDiskCache: 90,
                                      maxWidthDiskCache: 90,
                                      width: Dimens.fifty,
                                      height: Dimens.fifty,
                                      placeholder: (context, url) =>
                                          Image.asset(
                                        AssetConstants.usera,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        AssetConstants.usera,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "${item.name} ${item.fathername} ${item.surname}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.blackGuj60018,
                                ),
                                subtitle: Padding(
                                  padding: Dimens.edgeInsetsTopt10,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: Dimens.thirty,
                                        padding: Dimens.edgeInsets05_00_05_00,
                                        decoration: BoxDecoration(
                                          color: ColorsValue.lightMainColor,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.six,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            item.village?.gujaratiName ??
                                                " -- ",
                                            style: Styles.mainGuj60016,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
