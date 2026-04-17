import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.white,
          body: Stack(
            children: [
              Padding(
                padding: Dimens.edgeInsets20,
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hey, Login Now',
                          style: Styles.main70030,
                        ),
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'login_des'.tr,
                          textAlign: TextAlign.center,
                          style: Styles.grey9BA0A840014,
                        ),
                      ),
                      Dimens.boxHeight50,
                      CustomInternationalPhoneFild(
                        text: ''.tr,
                        initialvalue: PhoneNumber(
                          isoCode: PhoneNumber.getISO2CodeByPrefix(
                            controller.dailcode,
                          ),
                        ),
                        onInputChanged: (PhoneNumber number) {
                          controller.dailcode = number.dialCode ?? '';
                        },
                        oninitialValidation: (bool value) {
                          controller.isValid = value;
                          controller.update();
                        },
                        textEditingController: controller.phoneNumberController,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "મોબાઈલ નંબર દાખલ કરો";
                          } else if (!controller.isValid) {
                            return "માન્ય મોબાઈલ નંબર દાખલ કરો";
                          }
                          return null;
                        },
                      ),
                      Dimens.boxHeight50,
                      CustomButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.loginApi("", false);
                          }
                        },
                        text: 'Continue',
                      ),
                      Dimens.boxHeight25,
                      RichText(
                        text: TextSpan(
                          text: 'Are you new? ',
                          style: Styles.black2E363F50014,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Register Now',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  RouteManagement.goToRegisterScreen();
                                },
                              style: Styles.black2E363FLine70014,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (controller.isLoginLoading) ...[
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
        );
      },
    );
  }
}
