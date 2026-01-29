import 'package:flutter/material.dart';

import '../app.dart';

class CustomTextFormField extends StatefulWidget {
  String? text;
  String? hintText;
  TextEditingController? controller;
  bool obscure;
  bool autofocus;
  Widget? suffixIcon;
  Widget? prefixIcon;
  int? maxLength;
  int? maxLines;
  TextInputType? keybordtype;
  String? Function(String?)? validation;
  Color? fillColor;
  bool isCompulsoryText;
  bool isGujarati;
  bool readOnly;
  void Function()? onTap;
  ValueChanged<String>? onChanged;
  TextInputAction? textInputAction;

  CustomTextFormField({
    Key? key,
    required this.text,
    this.hintText,
    this.controller,
    this.obscure = false,
    this.autofocus = false,
    this.isCompulsoryText = false,
    this.readOnly = false,
    this.suffixIcon,
    this.keybordtype,
    this.textInputAction,
    this.maxLength,
    this.maxLines,
    this.validation,
    this.isGujarati = false,
    this.onChanged,
    required this.fillColor,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isCompulsoryText
            ? Row(
                children: [
                  Text(
                    widget.text!,
                    style: widget.isGujarati
                        ? Styles.grey9BA0A8Guj90016
                        : Styles.grey9BA0A890016,
                  ),
                  Dimens.boxWidth3,
                  Text(
                    "*",
                    textAlign: TextAlign.start,
                    style: widget.isGujarati
                        ? Styles.redColorGuj70010
                        : Styles.redColor70010,
                  )
                ],
              )
            : Text(
                widget.text!,
                style: widget.isGujarati
                    ? Styles.grey9BA0A8Guj90016
                    : Styles.grey9BA0A890016,
              ),
        Dimens.boxHeight5,
        TextFormField(
          controller: widget.controller,
          cursorColor: ColorsValue.maincolor,
          obscureText: widget.obscure,
          readOnly: widget.readOnly,
          onChanged: widget.onChanged,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          autofocus: widget.autofocus,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keybordtype,
          validator: widget.validation,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            counterText: '',
            contentPadding: Dimens.edgeInsets10,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: Dimens.zero, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(Dimens.five),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: Dimens.zero, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(Dimens.five),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: Dimens.zero, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(Dimens.five),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: Dimens.zero, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(Dimens.five),
            ),
            fillColor: widget.fillColor,
            filled: true,
            hintText: widget.hintText,
            hintStyle: Styles.grey9BA0A850018,
            errorBorder: InputBorder.none,
            errorStyle: Styles.redColor70010,
          ),
        )
      ],
    );
  }
}
