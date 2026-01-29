import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (context) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AssetConstants.splash,
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: double.maxFinite,
              ),
              Image.asset(
                AssetConstants.app_logo,
              ),
            ],
          ),
        );
      },
    );
  }
}
