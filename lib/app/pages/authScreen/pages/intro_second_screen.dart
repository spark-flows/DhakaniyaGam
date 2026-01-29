import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroSecondScreen extends StatefulWidget {
  const IntroSecondScreen({super.key});

  @override
  State<IntroSecondScreen> createState() => _IntroSecondScreenState();
}

class _IntroSecondScreenState extends State<IntroSecondScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      RouteManagement.goToIntroThiredScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.whiteColor,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              AssetConstants.spalsh_screen,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetConstants.app_logo,
                ),
                Dimens.boxHeight50,
                Text(
                  'ડિજીટલ સોવેનિયર વિમોચન કર્તા',
                  style: Styles.redColor80018,
                ),
                Dimens.boxHeight10,
                Text(
                  'શ્રી જગદિશભાઈ ડી. સંઘાણી',
                  style: Styles.mainGuj80018,
                ),
                Text(
                  'શ્રીમતિ કમલબેન જે. સંઘાણી\n(ભડિયાદ)',
                  style: Styles.mainGuj80018,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
