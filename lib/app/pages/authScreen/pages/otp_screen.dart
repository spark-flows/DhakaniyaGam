import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      initState: (as) {
        var controller = Get.find<AuthController>();
        controller.otpTextEditingController = TextEditingController();
        controller.otpKey = Get.arguments[1] ?? "";
        controller.otpMobile = Get.arguments[0] ?? "";
        controller.counter = 30;
        controller.startTimer();
      },
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorsValue.whiteColor,
          elevation: Dimens.zero,
          leading: Container(
            margin: Dimens.edgeInsetsLeft20,
            child: IconButton(
              icon: SvgPicture.asset(AssetConstants.ic_left_arrow),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: Dimens.edgeInsets20,
              child: Form(
                key: controller.otpFormKey,
                child: ListView(
                  children: [
                    Dimens.boxHeight30,
                    Text(
                      'Enter OTP',
                      style: Styles.main70030,
                    ),
                    Dimens.boxHeight10,
                    Text(
                      "Enter the 6-digit code you received to",
                      style: Styles.grey9BA0A840014,
                    ),
                    Dimens.boxHeight30,
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      autoFocus: true,
                      hintCharacter: "0",
                      hintStyle: Styles.grey9BA0A840014,
                      pastedTextStyle: TextStyle(
                        color: ColorsValue.maincolor,
                        fontWeight: FontWeight.bold,
                      ),
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        activeColor: ColorsValue.maincolor,
                        selectedColor: ColorsValue.maincolor,
                        inactiveColor: ColorsValue.textfild,
                        selectedFillColor: ColorsValue.whiteColor,
                        inactiveFillColor: ColorsValue.textfild,
                        activeFillColor: ColorsValue.whiteColor,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(Dimens.five),
                        fieldHeight: Get.width / Dimens.eight,
                        fieldWidth: Get.width / Dimens.eight,
                      ),
                      cursorColor: ColorsValue.color2E363F,
                      enableActiveFill: true,
                      controller: controller.otpTextEditingController,
                      keyboardType: TextInputType.number,
                      errorTextMargin: Dimens.edgeInsetsTop20,
                      errorTextSpace: Dimens.twentyFive,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 2,
                        )
                      ],
                      validator: (value) {
                        return controller.validotp(value!);
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    ),
                    Dimens.boxHeight30,
                    if (controller.counter == 0) ...[
                      Dimens.boxHeight30,
                      Center(
                          child: RichText(
                        text: TextSpan(
                          text: 'didnt_recevie_code'.tr,
                          style: Styles.grey9BA0A840014,
                          children: [
                            TextSpan(
                              text: 'resend_code'.tr,
                              style: Styles.main60014,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.counter = 30;
                                  controller.startTimer();
                                  controller.loginApi(
                                      controller.otpMobile ?? "", true);
                                },
                            ),
                          ],
                        ),
                      )),
                    ] else ...[
                      Dimens.boxHeight30,
                      Center(
                        child: Text(
                          '00:${controller.counter <= 9 ? '0${controller.counter}' : controller.counter}',
                          style: Styles.black2E363F50018,
                        ),
                      ),
                    ],
                    Dimens.boxHeight30,
                    CustomButton(
                      text: "Verify".toUpperCase(),
                      onPressed: () {
                        if (controller.otpFormKey.currentState!.validate()) {
                          controller.verifyOtpApi("", true);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            if (controller.isOtpLoading) ...[
              Container(
                height: Get.height,
                width: Get.width,
                alignment: Alignment.center,
                color: ColorsValue.blackColor.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorsValue.maincolor,
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
