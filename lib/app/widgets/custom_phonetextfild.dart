import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomInternationalPhoneFild extends StatelessWidget {
  const CustomInternationalPhoneFild({
    Key? key,
    required this.text,
    this.validation,
    this.initialvalue,
    this.onInputChanged,
    this.oninitialValidation,
    this.textEditingController,
  }) : super(key: key);
  final String text;
  final String? Function(String?)? validation;
  final PhoneNumber? initialvalue;
  final Function(PhoneNumber)? onInputChanged;
  final Function(bool)? oninitialValidation;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) => InternationalPhoneNumberInput(
        onInputChanged: onInputChanged,
        textStyle: Styles.black2E363F50018,
        onInputValidated: oninitialValidation,
        initialValue: initialvalue,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
          setSelectorButtonAsPrefixIcon: true,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        selectorTextStyle: const TextStyle(color: ColorsValue.color2E363F),
        textFieldController: textEditingController,
        formatInput: false,
        keyboardType: const TextInputType.numberWithOptions(
            signed: false, decimal: false),
        inputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.five),
            borderSide: const BorderSide(color: ColorsValue.transparent)),
        inputDecoration: InputDecoration(
            contentPadding: Dimens.edgeInsets12,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.five),
              borderSide: const BorderSide(color: ColorsValue.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.five),
              borderSide: const BorderSide(color: ColorsValue.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.five),
              borderSide: const BorderSide(color: ColorsValue.transparent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.five),
              borderSide: const BorderSide(color: ColorsValue.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.five),
              borderSide: const BorderSide(color: ColorsValue.transparent),
            ),
            hintText: "phone_number".tr,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.five),
              borderSide: const BorderSide(color: ColorsValue.transparent),
            ),
            filled: true,
            hintStyle: Styles.grey9BA0A850014,
            fillColor: ColorsValue.textfild,
            errorStyle: Styles.redColorGuj70010),
        validator: validation,
      );
}
