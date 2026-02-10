import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SevaoScreen extends StatelessWidget {
  const SevaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SevaoController>(builder: (controller) {
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
            'સેવાઓ',
            style: Styles.mainGuj90020,
          ),
        ),
        body: ListView(
          padding: Dimens.edgeInsets20,
          children: [
            InkWell(
              onTap: () {
                RouteManagement.goToSecshanikSahayYojnaScreen();
              },
              child: Container(
                height: Dimens.sixtySix,
                decoration: BoxDecoration(
                  color: ColorsValue.white,
                  border: Border.all(
                    color: ColorsValue.maincolor,
                    width: Dimens.one,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    dense: true,
                    title: Text(
                      "શૈક્ષણિક સહાય માટેની અરજી",
                      style: Styles.mainGuj90018,
                    ),
                    trailing: SvgPicture.asset(AssetConstants.ic_arrow_right),
                  ),
                ),
              ),
            ),
            Dimens.boxHeight20,
            InkWell(
              onTap: () {
                RouteManagement.goToVidhvaSahayYojnaScreen();
              },
              child: Container(
                height: Dimens.sixtySix,
                decoration: BoxDecoration(
                  color: ColorsValue.white,
                  border: Border.all(
                    color: ColorsValue.maincolor,
                    width: Dimens.one,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    dense: true,
                    title: Text(
                      "વિધવા સહાય યોજના",
                      style: Styles.mainGuj90018,
                    ),
                    trailing: SvgPicture.asset(AssetConstants.ic_arrow_right),
                  ),
                ),
              ),
            ),
            Dimens.boxHeight20,
            InkWell(
              onTap: () {
                RouteManagement.goTovagerVyajYojnaScreen();
              },
              child: Container(
                height: Dimens.sixtySix,
                decoration: BoxDecoration(
                  color: ColorsValue.white,
                  border: Border.all(
                    color: ColorsValue.maincolor,
                    width: Dimens.one,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimens.six,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: Dimens.edgeInsets20_00_20_00,
                    dense: true,
                    title: Text(
                      "વગર વ્યાજ લોનની યોજના",
                      style: Styles.mainGuj90018,
                    ),
                    trailing: SvgPicture.asset(AssetConstants.ic_arrow_right),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
