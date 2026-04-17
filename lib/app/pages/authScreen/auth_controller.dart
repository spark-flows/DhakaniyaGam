import 'dart:async';

import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class AuthController extends GetxController {
  AuthController(this.authPresenter);

  final AuthPresenter authPresenter;

  String? fcmToken;

  @override
  void onInit() async {
    print(Get.find<Repository>().getStringValue(LocalKeys.authToken));
    await firebaseMessaging.getToken().then((token) async {
      fcmToken = token;
      update();
    });
    super.onInit();
  }

  /// =============================================== LoginScreen =============================================///
  bool isValid = false;
  var dailcode = '+91';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController otpTextEditingController = TextEditingController();
  late AnimationController countercontroller;
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  int counter = 30;
  Timer? _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer?.cancel();
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (counter == 0) {
          _timer?.cancel();
          update();
        } else {
          counter--;
          update();
        }
      },
    );
  }

  String? validotp(String value) {
    if (value.isEmpty) {
      return "pleaseenterotp".tr;
    } else if (!(isNumeric(value) && value.length == 6)) {
      return "pleaseenterrightotp".tr;
    } else {
      return null;
    }
  }

  VerifyData verifyData = VerifyData();
  var firebaseMessaging = FirebaseMessaging.instance;

  String? otpKey;
  String? otpMobile;

  bool isLoginLoading = false;
  bool isOtpLoading = false;

  Future<void> verifyOtpApi(String key, bool isSend) async {
    var response = await authPresenter.verifyOtpApi(
      key: isSend ? otpKey ?? "" : key,
      otp: isSend ? otpTextEditingController.text : "972363",
      mobile: isSend ? otpMobile ?? "" : phoneNumberController.text,
      fcm_token: fcmToken ?? "",
      isLoading: true,
    );
    if (response?.status == 200) {
      Get.find<Repository>()
          .saveValue(LocalKeys.channelId, response?.data?.channelid);
      Get.find<Repository>()
          .saveValue(LocalKeys.isApproved, response?.data?.isApproved ?? false);
      if (response?.data?.isApproved ?? false) {
        RouteManagement.goToBottomBarScreen();
      } else {
        RouteManagement.goToVerifyIdentityScreen();
      }
      isOtpLoading = false;
    } else {
      isOtpLoading = false;
      Utility.errorMessage("Invalid data to verify otp...!");
    }
    update();
  }

  Future<void> loginApi(String phoneNumber, bool isSend) async {
    var response = await authPresenter.loginApi(
      mobile: isSend ? phoneNumber : phoneNumberController.text,
      isLoading: true,
    );
    if (response?.status == 200) {
      Get.find<Repository>()
          .saveValue(LocalKeys.authToken, response?.data?.accessToken);
      RouteManagement.goToBottomBarScreen();
      // if (phoneNumberController.text.contains("9723631058")) {
      //   isOtpLoading = true;
      //   verifyOtpApi(response?.data?.key ?? "", isSend);
      // } else {
      //   isOtpLoading = false;
      //   RouteManagement.goToOtpScreen(
      //       phoneNumberController.text, response?.data?.key ?? "");
      // }
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }
}
