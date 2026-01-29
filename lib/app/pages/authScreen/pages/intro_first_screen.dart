import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroFirstScreen extends StatefulWidget {
  const IntroFirstScreen({super.key});

  @override
  State<IntroFirstScreen> createState() => _IntroFirstScreenState();
}

class _IntroFirstScreenState extends State<IntroFirstScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      RouteManagement.goToIntroSecondScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: ColorsValue.whiteColor,
        body: Center(
          child: Image.asset(
            AssetConstants.first_page,
            fit: BoxFit.fill,
          ),
        ),
      );
    });
  }
}
