import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VillageYadiListScreen extends StatelessWidget {
  const VillageYadiListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<DashboardController>(initState: (state) async {
      var controller = Get.find<DashboardController>();
      await controller.getAllVillage(1);
      controller.scrollController.addListener(() async {
        if (controller.scrollController.position.pixels ==
            controller.scrollController.position.maxScrollExtent) {
          if (controller.isLoading == false) {
            controller.isLoading = true;
            controller.update();
            if (controller.isGroupLastPage == false) {
              await controller.getAllVillage(controller.pageGroupCount);
            }
            controller.isLoading = false;
            controller.update();
          }
        }
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
            'village_yadi'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20_00_20_20,
          child: Column(
            children: [
              CustomTextFormField(
                controller: controller.searchVillageYadiListController,
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
                        return controller.getAllVillage(1);
                      },
                    );
                  });
                },
              ),
              Dimens.boxHeight20,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => Future.sync(
                    () => controller.getAllVillage(1),
                  ),
                  child: GridView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.chatGroupMessageList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: Dimens.ninty,
                    ),
                    itemBuilder: (context, index) {
                      var item = controller.chatGroupMessageList[index];
                      return InkWell(
                        onTap: () {
                          RouteManagement.goToVillageYadiDetailScreen(
                              item.id ?? "", item.gujaratiName ?? "");
                        },
                        child: Container(
                          padding: Dimens.edgeInsets5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.ten),
                            color: ColorsValue.white,
                            border: Border.all(
                              width: Dimens.one,
                              color: ColorsValue.maincolor,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.gujaratiName ?? "",
                                style: Styles.mainGuj90018,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                              Dimens.boxHeight5,
                              Text(
                                "સભ્યો: ${item.totalMembers}",
                                style: Styles.grey9BA0A860014,
                              )
                            ],
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
