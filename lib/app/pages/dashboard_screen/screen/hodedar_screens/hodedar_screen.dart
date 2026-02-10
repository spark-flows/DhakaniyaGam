import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HodedarScreen extends StatelessWidget {
  const HodedarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<DashboardController>(initState: (state) {
      var controller = Get.find<DashboardController>();
      controller.searchPresidentController.clear();
      controller.pagingCommitteeController = PagingController(firstPageKey: 1);
      controller.pagingCommitteeController
          .addPageRequestListener((pageKey) async {
        await controller.postCommitteemembers(pageKey, "president");
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
            'incumbent'.tr,
            style: Styles.mainGuj90020,
          ),
        ),
        body: ListView.builder(
          padding: Dimens.edgeInsets20_20_20_0,
          itemCount: controller.hodedarList.length,
          itemBuilder: (context, index) {
            var item = controller.hodedarList[index];
            return InkWell(
              onTap: () {
                switch (index) {
                  case 0:
                    RouteManagement.goToPresidentScreen('president');
                  case 1:
                    RouteManagement.goToPresidentScreen('vice_president');
                  case 2:
                    RouteManagement.goToPresidentScreen('minister');
                  case 3:
                    RouteManagement.goToPresidentScreen('co_minister');
                  case 4:
                    RouteManagement.goToPresidentScreen('treasurer');
                  case 5:
                    RouteManagement.goToPresidentScreen('co_treasurer');
                }
              },
              child: Padding(
                padding: Dimens.edgeInsets00_10_00_10,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsValue.white,
                    borderRadius: BorderRadius.circular(
                      Dimens.six,
                    ),
                    border: Border.all(
                      width: Dimens.one,
                      color: ColorsValue.maincolor,
                    ),
                  ),
                  child: ListTile(
                    leading: Text(
                      item,
                      style: Styles.black2E363F60018,
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.ic_arrow_right,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
