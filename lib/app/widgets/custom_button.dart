import 'package:dhakaniya_gam/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  Function()? onPressed;
  String? text;
  Color? backGroundColor;
  TextStyle? textStyle;
  double? height;
  CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backGroundColor,
    this.textStyle,
    this.height,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? Dimens.fifty,
      width: Get.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            double.infinity,
            Dimens.fifty,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.five),
          ),
          backgroundColor: widget.backGroundColor ?? ColorsValue.maincolor,
        ),
        child: Text(
          widget.text ?? "",
          style: widget.textStyle ?? Styles.whiteFFFBD670018,
        ),
      ),
    );
  }
}
