import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/data/helpers/api_wrapper.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SabhayYadiScreen extends StatelessWidget {
  const SabhayYadiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);

    return GetBuilder<DashboardController>(initState: (state) {
      var controller = Get.find<DashboardController>();
      controller.searchController.clear();
      controller.pagingController = PagingController(firstPageKey: 1);
      controller.pagingController.addPageRequestListener(
        (pagekey) async {
          await controller.getAllUsers(pagekey);
        },
      );
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
            'list_of_members'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20_00_20_00,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: controller.searchController,
                      hintText: 'search'.tr,
                      fillColor: ColorsValue.greyEEEEEE,
                      text: '',
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
                              return controller.pagingController.refresh();
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
                                    Dimens.boxHeight20,
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
                                    // Dimens.boxHeight20,
                                    // Align(
                                    //   alignment: Alignment.centerLeft,
                                    //   child: Text(
                                    //     'surName'.tr,
                                    //     style: Styles.grey9BA0A8Guj90016,
                                    //   ),
                                    // ),
                                    // Container(
                                    //   height: Dimens.fifty,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(
                                    //               Dimens.six),
                                    //       color: ColorsValue.greyEEEEEE),
                                    //   child: DropdownButton<String>(
                                    //     underline: Container(),
                                    //     hint: Text(
                                    //       'surName'.tr,
                                    //       style: Styles.grey9BA0A8Guj90016,
                                    //     ),
                                    //     padding: EdgeInsets.only(
                                    //         left: Dimens.ten,
                                    //         right: Dimens.ten),
                                    //     isExpanded: true,
                                    //     icon: SvgPicture.asset(
                                    //         AssetConstants.ic_down_arrow),
                                    //     value: controller.selectStudyValue,
                                    //     items: controller.selectStudyLists
                                    //         .map(
                                    //             (value) => DropdownMenuItem(
                                    //                   value: value.id,
                                    //                   child: Text(value
                                    //                           .gujaratiName ??
                                    //                       ''),
                                    //                 ))
                                    //         .toList(),
                                    //     onChanged: (newValue) {
                                    //       controller.selectStudyValue =
                                    //           newValue;
                                    //       setState(() {});
                                    //     },
                                    //   ),
                                    // ),
                                    Dimens.boxHeight20,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.selectVillageValue =
                                                  "";
                                              controller.selectBusinessValue =
                                                  "";
                                              controller.selectStudyValue = "";
                                              controller.selectBloodValue =
                                                  "Select BloodGroup";
                                              controller.pagingController
                                                  .refresh();
                                              Navigator.pop(context);
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
                                              Navigator.pop(context);
                                              controller.pagingController
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
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () => Future.sync(
                  () => controller.pagingController.refresh(),
                ),
                child: PagedListView<int, GetAllUsersDoc>(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<GetAllUsersDoc>(
                    noItemsFoundIndicatorBuilder: (context) {
                      return Center(
                        child: Text(
                          "${'list_of_members'.tr} ડેટા મળ્યો નથી...!",
                          style: Styles.mainGuj50014,
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
                                  style: Styles.blackGuj60018,
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
                ),
              ))
            ],
          ),
        ),
      );
    });
  }
}
