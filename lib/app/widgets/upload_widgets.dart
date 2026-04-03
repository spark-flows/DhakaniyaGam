import 'package:dhakaniya_gam/app/app.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadWidgets extends StatelessWidget {
  final String txt;
  final String? svgPicture;
  Color bgColor;
  double height;
  GestureTapCallback onTap;
  UploadWidgets(
      {Key? key,
      required this.txt,
      required this.height,
      required this.onTap,
      required this.bgColor,
      this.svgPicture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(Dimens.five)),
      child: InkWell(
        onTap: onTap,
        child: DottedBorder(
          options: RectDottedBorderOptions(
            color: ColorsValue.maincolor,
            strokeWidth: Dimens.two,
            dashPattern: [
              Dimens.five,
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(svgPicture ?? ""),
              Dimens.boxWidth10,
              Center(
                child: Text(
                  txt,
                  style: Styles.greyA6A6A660014,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
