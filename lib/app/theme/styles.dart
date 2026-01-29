//coverage:ignore-file

import 'package:dhakaniya_gam/app/theme/colors_value.dart';
import 'package:dhakaniya_gam/app/theme/dimens.dart';
import 'package:dhakaniya_gam/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  static String? fontFamily = globalVariable == 1 ? 'Product-Sans' : 'Avenir';

  static TextStyle mainGuj90028 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w900,
    fontSize: Dimens.twentyEight,
  );

  static TextStyle mainGuj90018 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w900,
    fontSize: Dimens.eighteen,
  );

  static TextStyle mainGuj90022 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w900,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle mainGuj70018 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.eighteen,
  );

  static TextStyle colorD21A0E90018 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.colorD21A0E,
    fontWeight: FontWeight.w900,
    fontSize: Dimens.eighteen,
  );

  static TextStyle colorD21A0E60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.colorD21A0E,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle colorABADB060012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.colorABADB0,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle colorACACAC60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.colorACACAC,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle whiteGuj70018 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.white,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.eighteen,
  );

  static TextStyle whiteGuj70014 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.white,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fourteen,
  );

  static TextStyle mainGuj90020 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w900,
    fontSize: Dimens.twenty,
  );

  static TextStyle color1D1E2070018 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.color1D1E20,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.eighteen,
  );

  static TextStyle color1D1E2060020 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.color1D1E20,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twenty,
  );

  static TextStyle mainGuj80014 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w800,
    fontSize: Dimens.fourteen,
  );

  static TextStyle mainGuj80018 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w800,
    fontSize: Dimens.eighteen,
  );

  static TextStyle grey9BA0A8Guj90016 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.grey9BA0A8,
    fontWeight: FontWeight.w900,
    fontSize: Dimens.sixteen,
  );

  static TextStyle redGuj50012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle mainGuj60016 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sixteen,
  );

  static TextStyle mainGuj50016 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.sixteen,
  );

  static TextStyle mainGuj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle grey9393Guj60016 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.grey9393,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sixteen,
  );

  static TextStyle grey9393Guj60014 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.grey9393,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );

  static TextStyle redColorGuj70010 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.ten,
  );

  static TextStyle redColorGuj60014 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackGuj60014 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );
  static TextStyle blackGuj60016 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blackGuj50016 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blackGuj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackGuj80014 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w800,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackGuj60018 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.eighteen,
  );

  static TextStyle blackGuj60020 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twenty,
  );

  static TextStyle blackGuj70018 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.eighteen,
  );

  static TextStyle orangeGuj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.orange,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle greenGuj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.green,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle redGuj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle grey9393Guj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.grey9393,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle redD4363AGuj70012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.redD4363A,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.twelve,
  );

  static TextStyle whiteFFFBD670018 = GoogleFonts.poppins(
    color: ColorsValue.whiteFFFBD6,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.eighteen,
  );

  static TextStyle main70030 = GoogleFonts.poppins(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.thirty,
  );

  static TextStyle main50012 = GoogleFonts.poppins(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle main60018 = GoogleFonts.poppins(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.eighteen,
  );

  static TextStyle main60014 = GoogleFonts.poppins(
    color: ColorsValue.maincolor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );

  static TextStyle color39318560018 = GoogleFonts.poppins(
    color: ColorsValue.color393185,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.eighteen,
  );

  static TextStyle color39318560016 = GoogleFonts.poppins(
    color: ColorsValue.color393185,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sixteen,
  );

  static TextStyle color39318570016 = GoogleFonts.poppins(
    color: ColorsValue.color393185,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.sixteen,
  );

  static TextStyle grey9BA0A840014 = GoogleFonts.poppins(
    color: ColorsValue.grey9BA0A8,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );

  static TextStyle grey9BA0A850012 = GoogleFonts.poppins(
    color: ColorsValue.grey9BA0A8,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle grey9BA0A890016 = GoogleFonts.poppins(
    color: ColorsValue.grey9BA0A8,
    fontWeight: FontWeight.w900,
    fontSize: Dimens.sixteen,
  );

  static TextStyle greyA6A6A660014 = GoogleFonts.poppins(
    color: ColorsValue.greyA6A6A6,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );

  static TextStyle grey9BA0A850018 = GoogleFonts.poppins(
    color: ColorsValue.grey9BA0A8,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.eighteen,
  );

  static TextStyle grey9BA0A850014 = GoogleFonts.poppins(
    color: ColorsValue.grey9BA0A8,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );
  static TextStyle grey9BA0A860014 = GoogleFonts.poppins(
    color: ColorsValue.grey9BA0A8,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black2E363F70014 = GoogleFonts.poppins(
    color: ColorsValue.black2E363F,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black2E363F50018 = GoogleFonts.poppins(
    color: ColorsValue.black2E363F,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.eighteen,
  );

  static TextStyle black2E363F60018 = GoogleFonts.poppins(
    color: ColorsValue.black2E363F,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.eighteen,
  );

  static TextStyle black2E363F50014 = GoogleFonts.poppins(
    color: ColorsValue.black2E363F,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fifteen,
  );

  static TextStyle black2E363F60014 = GoogleFonts.poppins(
    color: ColorsValue.black2E363F,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black2E363FLine70014 = GoogleFonts.poppins(
    color: ColorsValue.black2E363F,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fourteen,
    decoration: TextDecoration.underline,
  );

  static TextStyle redColor70010 = GoogleFonts.poppins(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.ten,
  );

  static TextStyle redColor50014 = GoogleFonts.poppins(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle redColor80018 = GoogleFonts.poppins(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w800,
    fontSize: Dimens.eighteen,
  );
}
