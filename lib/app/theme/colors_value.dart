// coverage:ignore-file
import 'package:flutter/material.dart';

/// A list of custom color used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class ColorsValue {
  /// Colors
  static Color primaryColor = const Color(
    primaryColorHex,
  );
  static Color lightPrimaryColor = const Color(lightPrimary).withOpacity(.1);

  static Color instagramAddIconsColor = const Color(
    instagramAddIconsColorHex,
  );
  static Color bottomSheetLightBackground = const Color(
    bottomSheetLightBackgroundHex,
  );

  static const Color blackColor = Color(
    blackColorHex,
  );
  static const Color lightGreyCancelButtonColor = Color(
    greyColorHex,
  );
  static const Color hookupHeaderBlackColor = Color(
    hookupHeaderBlackColorHex,
  );
  static const Color hookupHeaderGreyColor = Color(
    hookupHeaderGreyColorHex,
  );
  static const Color hookupSubHeaderGreyColor = Color(
    hookupSubHeaderGreyColorHex,
  );
  static const Color hookupSubHeaderLightBlackColor = Color(
    lightBlackColorHex,
  );
  static const Color hookupTermsWhiteColor = Color(
    hookupTermsWhiteColorHex,
  );
  static const Color hookupBorderGreyColor = Color(
    hookupBorderGreyColorHex,
  );

  static const Color whiteColor = Color(
    whiteColorHex,
  );

  static const Color greenColor = Color(
    greenColorHex,
  );

  static const Color redColor = Color(
    redColorHex,
  );
  static const Color greyFillColor = Color(
    greyFillColorHex,
  );

  static const Color redColorDark = Color(
    redColorDarkHex,
  );

  static const Color hookupOrangeColor = Color(
    hookupOrangeColorHex,
  );
  static const Color hookupOrangeSelectedColor = Color(
    hookupOrangeSelectedColorHex,
  );

  static const Color blueColor = Color(
    blueColorHex,
  );

  // static const Color bluedarkColor = Color(
  //     bluedarkColorHex
  // );

  static const Color skyBlueColor = Color(
    skyBlueColorHex,
  );

  static const Color greyColor = Color(
    greyColorHex,
  );

  static const Color greyDividerColor = Color(lightGreyDividerColorHex);

  static const Color lightGreyTextColor = Color(lightGreyTextColorHex);

  static const Color transparent = Colors.transparent;

  // ============================================

  /// Non-common Colors
  ///
  static const Color facebookButtonColor = Color(
    facebookButtonColorHex,
  );

  static const Color iconColor = Color(
    iconColorHex,
  );

  static const Color greyLightColor = Color(
    greyLightColorHex,
  );

  static const Color purpleColor = Color(
    purpleColorHex,
  );

  static const Color lightGreyColorWithOpacity35 = Color(
    lightGreyColorWithOpacityHex35,
  );

  static const Color lightGreyColor = Color(
    lightGreyColorHex,
  );

  static const Color heavyGreyColor = Color(
    heavyGreyColorHex,
  );

  static const Color lightGreyColorWithOpacity50 = Color(
    lightGreyColorWithOpacityHex50,
  );

  static const Color lightRedColor = Color(
    lightRedColorHex,
  );

  static const Color blackColorWithOpacity59 = Color(
    blackColorHexWithOpacity59,
  );

  static const Color primaryColorWithOpacity = Color(
    primaryColorHexWithOpacity,
  );

  static const Color textFieldColor = Color(
    textFieldColorHex,
  );

  static const Color subTitleColor = Color(
    subTitlecolorHex,
  );

  static const Color originalGreyColor = Color(
    originalGreyColorHex,
  );

  static const Color textfieldHintColor = Color(
    textfieldHintColorHex,
  );

  static const Color bottomNavBgColor = Color(
    bottomNavBgColorHex,
  );

  static const Color blueMediumColor = Color(
    blueMediumColorHex,
  );

  static const Color blueDarkColor = Color(
    darkBlueColorHex,
  );

  static const Color lightBlueColor = Color(
    lightBlueColorHex,
  );

  static const Color lightBlueishColor = Color(
    lightBlueishColorHex,
  );

  static const Color lightGreenColor = Color(
    lightGreenColorHex,
  );

  static const Color yellowColor = Color(
    yellowColorHex,
  );

  static const Color greyLightColo = Color(greyLightColoHex);

  static const Color loginPlaceholderFontColor = Color(
    loginPlaceholderFontColorHex,
  );

  static const Color pinkColor = Color(
    pinkColorHex,
  );

  static const Color greyBorderColor = Color(
    greyBorderColorHex,
  );

  static const Color shadowColor = Color(
    shadowColorHex,
  );

  static const Color checkBoxColor = Color(
    checkBoxColorHex,
  );

  static const textFieldBorderColor = Color(
    textFieldBorderColorHex,
  );

  static const greySvgColor = Color(
    greySvgColorHex,
  );

  static const tabBarUnselectedColor = Color(
    tabBarUnselectedColorHex,
  );

  static const reelsGiftButtonBlackColor = Color(
    reelsGiftButtonBlackColorHex,
  );

  static const reelsGiftButtonInnerBorderColor = Color(
    reelsGiftButtonInnerBorderColorHex,
  );

  static const dialogDividerColor = Color(
    dialogDividerColorHex,
  );

  static const reddishOrangeColor = Color(
    reddishOrangeColorHex,
  );

  /// tirth kevadiya
  static const textfild = Color(textfildcolor);
  static const forgetpass = Color(forgetpassword);
  static const white = Color(textcolor1);
  static const color2E363F = Color(0xff2E363F);
  static const blackdark = Color(0xff2E364F);
  static const second = Color(secondcolor);
  static const appbar = Color(Appbar);
  static const white12 = Color(White12);
  static const lightgreen = Color(Lilghtgreen);
  static const amber = Color(0xFFFFC107);
  static const darkColor = Color(darkblueColor);
  static const redTxtColor = Color(redTextColor);
  static const appbarcolor = Color(0xFF25374F);
  static const grey = Color(greyColor1);
  static const textcolor = Color(0xff13E1B0);
  static const redeemcode = Color(0xffC4FBEE);
  static const yelloshade = Color(0xffFABA15);

  static const greyColor8888 = Color(greyColor8888Hex);
  static const greyColorEEEE = Color(greyColorEEEEHex);
  static const greyColor4444 = Color(greyColor4444Hex);
  static const giftBackgroundColor = Color(giftBackgroundColorHex);
  static const greyColor9195A8 = Color(greyColor9195A8Hex);

  // ===========================================================================

  /// Hex Values
  ///
  static const int primaryColorHex = 0x20C0E8;
  static const int blackColorHex = 0xff000000;
  static const int greyColorHex = 0xFFF8F8F8;
  static const int hookupHeaderBlackColorHex = 0xFF0A0A0A;
  static const int hookupHeaderGreyColorHex = 0xFFAAAAAA;
  static const int hookupSubHeaderGreyColorHex = 0xFF828282;
  static const int hookupTermsWhiteColorHex = 0xFFBABABA;
  static const int hookupBorderGreyColorHex = 0xFFCCCCCC;
  static const int whiteColorHex = 0xffffffff;
  static const int greenColorHex = 0xff009944;
  static const int redColorHex = 0xffFC5858;
  static const int greyFillColorHex = 0xffEEEEEE;
  static const int hookupOrangeColorHex = 0xFFEA6F00;
  static const int hookupOrangeSelectedColorHex = 0x1AEA6F00;
  static const int textcolor1 = 0xffFFFFFF;

  // static const int orangeColorHex = 0xfff0541e;
  static const int blueColorHex = 0xff2196f3;
  static const int darkBlueColorHex = 0xff1B53F4;
  static const int skyBlueColorHex = 0xff63c0df;
  // static const int greyColorHex = 0xff363636;
  static const int blueMediumColorHex = 0xffd9e5f6;
  static const int lightBlueColorHex = 0xffd1ddfd;
  static const int lightGreenColorHex = 0xff00D215;
  static const int yellowColorHex = 0xfffedf5c;
  static const int lightBlackColorHex = 0xff040414;

  // ============================================

  /// Hex Values for Non-Common Colors
  ///
  static const int facebookButtonColorHex = 0xff3B5998;
  static const int iconColorHex = 0xff606060;
  static const int greyLightColorHex = 0xff1C1C1C;
  static const int purpleColorHex = 0xffB000F0;
  static const int lightGreyColorWithOpacityHex35 = 0x59C9CCD1;
  static const int lightGreyColorHex = 0xffC9CCD1;
  static const int heavyGreyColorHex = 0xff666666;
  static const int lightGreyColorWithOpacityHex50 = 0x80C9CCD1;
  static const int lightRedColorHex = 0xffFF4A49;
  static const int blackColorHexWithOpacity59 = 0x59000000;
  static const int primaryColorHexWithOpacity = 0x596730EC;
  static const int textFieldColorHex = 0xffF1F2F6;
  static const int subTitlecolorHex = 0xfe666666;
  static const int originalGreyColorHex = 0xff535353;
  static const int textfieldHintColorHex = 0xffBFBFBF;
  static const int bottomNavBgColorHex = 0xff171717;
  static const int loginPlaceholderFontColorHex = 0xffD4D5D7;
  static const int lightGreyDividerColorHex = 0xffF6F6F6;
  static const int lightGreyTextColorHex = 0xff808080;
  static const int pinkColorHex = 0xffF31B82;
  static const int greyBorderColorHex = 0xffF2F2F2;
  static const int greyLightColoHex = 0xffCFCFCF;
  static const int redColorDarkHex = 0xffEB5757;
  static const int lightBlueishColorHex = 0xffEFF3FB;
  static const int shadowColorHex = 0xffDDE3F8;
  static const int checkBoxColorHex = 0xffD4D7D9;
  static const int lightPrimary = 0xffEA6F00;
  static const int bottomSheetLightBackgroundHex = 0xffFDF1E6;
  static const int instagramAddIconsColorHex = 0xffCECECE;
  static const int textFieldBorderColorHex = 0xffDDDDDD;
  static const int greySvgColorHex = 0xff9CA4B7;
  static const int tabBarUnselectedColorHex = 0xffCC9C9C9;
  static const int reelsGiftButtonBlackColorHex = 0xff302222;
  static const int reelsGiftButtonInnerBorderColorHex = 0xffFBA23B;
  static const int dialogDividerColorHex = 0xffE1E1E1;
  static const int greyColor8888Hex = 0xff888888;
  static const int greyColorEEEEHex = 0xffEEEEEE;
  static const int greyColor4444Hex = 0xff444444;
  static const int giftBackgroundColorHex = 0xffE2E2E2;
  static const int greyColor9195A8Hex = 0xff9195A8;
  static const int reddishOrangeColorHex = 0x1AFF4C00;

  static const int textfildcolor = 0xffEEEEEE;
  static const int forgetpassword = 0xffE58F0D;
  static const int secondcolor = 0xfffe4d5f;
  static const int third = 0xffffffff;
  static const int fourth = 0xffe8eaed;
  static const int Appbar = 0xff2E363F;
  static const int whitecolor = 0xffFFFFFF;
  static const int White12 = 0x1FFFFFFF;
  static const int Lilghtgreen = 0xff00E676;
  static const int darkblueColor = 0xff2E364F;
  static const int redTextColor = 0xffFF3D3D;
  static const int greyColor1 = 0xff9BA6A8;

  static Color darkAppColor = const Color(0xFF131F2E);
  static Color edtBgColor = const Color(0xFFEEEEEE);
  static Color lineColor = const Color(0xFFE9EAEE);
  static Color boxLineColor = const Color(0xFF686868);
  static Color txtgreyColor = const Color(0xFF999999);
  static Color dateColor = const Color(0xFF15E0B0);
  static Color darkYellowColor = const Color(0xFFFBA92F);
  static Color otpColor = const Color(0xFF8A8E9E);
  static Color chkBodarColor = const Color(0xFFAAAAAA);
  static Color tabColor = const Color(0xFF777777);
  static Color sliderColor = const Color(0xFFD6D7DC);
  static Color buttonColor = const Color(0xFF20C0E8);

  static Color primary = Color(0xff24374e);
  static Color background = Color(0xffffffff);
  static Color promotion = Color(0xffE9FBF7);
  static Color lightYellow = Color(0xffFFF0C8);
  static Color darkGrey = Color(0xffD1D1D1);

//New Color
  static Color maincolor = Color(0xFF3E4095);
  static Color lightMainColor = Color(0xFFE7E7FC);
  static Color grey9BA0A8 = Color(0xFF9BA0A8);
  static Color greyEEEEEE = Color(0xFFEEEEEE);
  static Color black2E363F = Color(0xFF2E363F);
  static Color whiteFFFBD6 = Color(0xFFFFFBD6);
  static Color greyE8EEEF = Color(0xFFE8EEEF);
  static Color greyA6A6A6 = Color(0xFFA6A6A6);
  static Color orange = Color(0xFFFC8415);
  static Color green = Color(0xFF048746);
  static Color grey9393 = Color(0xFF939393);
  static Color greyDDDD = Color(0xFFDDDDDDD);
  static Color redD4363A = Color(0xFFD4363A);
  static Color color393185 = Color(0xFF393185);
  static Color colorABADB0 = Color(0xFFABADB0);
  static Color colorACACAC = Color(0xFFACACAC);
  static Color colorD21A0E = Color(0xFFD21A0E);
  static Color color1D1E20 = Color(0xFF1D1E20);
  
}
